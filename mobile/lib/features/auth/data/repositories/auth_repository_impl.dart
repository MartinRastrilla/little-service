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

  const AuthRepositoryImpl({required this.remote, required this.local});

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
        // TODO(refresh-token): attempt POST /auth/refresh before clearing session.
        await local.clearSession();
        return const Left(
          CacheFailure('La sesión expiró', code: 'SESSION_EXPIRED'),
        );
      }

      // TODO(refresh-token): optionally validate session remotely via /auth/me.
      return Right(cached.toEntity());
    } catch (_) {
      return const Left(
        CacheFailure('No se pudo leer la sesión local', code: 'CACHE_READ_ERROR'),
      );
    }
  }
}
