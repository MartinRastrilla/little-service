import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/core/usecases/usecase.dart';
import 'package:mobile/core/utils/validators.dart';
import 'package:mobile/features/auth/domain/entities/auth_session.dart';
import 'package:mobile/features/auth/domain/repositories/auth_repository.dart';

class LoginParams {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});
}

class LoginUseCase implements UseCase<AuthSession, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, AuthSession>> call(LoginParams params) async {
    final emailError = validateEmail(params.email);
    if (emailError != null) {
      return Left(emailError);
    }

    final passwordError = validatePassword(params.password);
    if (passwordError != null) {
      return Left(passwordError);
    }

    return repository.login(
      email: params.email.trim(),
      password: params.password,
    );
  }
}
