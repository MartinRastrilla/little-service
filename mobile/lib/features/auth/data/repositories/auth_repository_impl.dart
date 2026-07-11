import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failure_mapper.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:mobile/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:mobile/features/auth/domain/entities/auth_session.dart';
import 'package:mobile/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;
  final AuthLocalDataSource local;

  Future<Either<Failure, AuthSession>>? _ongoingRefresh;

  AuthRepositoryImpl({required this.remote, required this.local});

  @override
  Future<Either<Failure, AuthSession>> login({
    required String email,
    required String password,
  }) async {
    try {
      final model = await remote.login(email: email, password: password);
      await local.saveSession(model);
      return Right(model.toEntity());
    } catch (error) {
      return Left(mapExceptionToFailure(error));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final refreshToken = await local.readRefreshToken();
      if (refreshToken != null && refreshToken.isNotEmpty) {
        try {
          await remote.logoutRemote(refreshToken: refreshToken);
        } catch (_) {
          // Best-effort: clear local session even if remote logout fails.
        }
      }

      await local.clearSession();
      return const Right(null);
    } catch (_) {
      return const Left(
        CacheFailure('No se pudo cerrar la sesión local', code: 'LOGOUT_ERROR'),
      );
    }
  }

  @override
  Future<Either<Failure, AuthSession>> getCachedSession() async {
    try {
      final cached = await local.readSession();
      if (cached == null) {
        return const Left(
          CacheFailure('No hay sesión guardada', code: 'NO_SESSION'),
        );
      }

      if (cached.expiresAt.isBefore(DateTime.now().toUtc())) {
        final refreshResult = await refreshSession();
        return await refreshResult.fold(
          (failure) async {
            await local.clearSession();
            if (failure.code == 'NO_SESSION' ||
                failure.code == 'REFRESH_TOKEN_EXPIRED') {
              return const Left<Failure, AuthSession>(
                CacheFailure('La sesión expiró', code: 'SESSION_EXPIRED'),
              );
            }
            return Left<Failure, AuthSession>(failure);
          },
          (session) async => Right<Failure, AuthSession>(session),
        );
      }

      return Right(cached.toEntity());
    } catch (_) {
      return const Left(
        CacheFailure('No se pudo leer la sesión local', code: 'CACHE_READ_ERROR'),
      );
    }
  }

  @override
  Future<Either<Failure, AuthSession>> refreshSession() {
    _ongoingRefresh ??= _performRefresh().whenComplete(
      () => _ongoingRefresh = null,
    );
    return _ongoingRefresh!;
  }

  Future<Either<Failure, AuthSession>> _performRefresh() async {
    try {
      final refreshToken = await local.readRefreshToken();
      if (refreshToken == null || refreshToken.isEmpty) {
        return const Left(
          CacheFailure('No hay refresh token guardado', code: 'NO_SESSION'),
        );
      }

      if (await local.isRefreshTokenExpired()) {
        return const Left(
          CacheFailure('El refresh token expiró', code: 'REFRESH_TOKEN_EXPIRED'),
        );
      }

      final model = await remote.refresh(refreshToken: refreshToken);
      await local.saveSession(model);
      return Right(model.toEntity());
    } catch (error) {
      final failure = mapExceptionToFailure(error);
      if (failure.code == 'REFRESH_TOKEN_INVALID' ||
          failure.code == 'REFRESH_TOKEN_EXPIRED' ||
          failure.code == 'REFRESH_TOKEN_REVOKED' ||
          failure.code == 'USER_INACTIVE') {
        await local.clearSession();
      }
      return Left(failure);
    }
  }
}
