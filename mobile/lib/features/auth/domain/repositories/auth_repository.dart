import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/features/auth/domain/entities/auth_session.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthSession>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, AuthSession>> getCachedSession();

  // TODO(refresh-token): Future<Either<Failure, AuthSession>> refreshSession();
  // Se implementará cuando el backend exponga refreshToken + POST /auth/refresh.
}
