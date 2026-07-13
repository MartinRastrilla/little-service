import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/core/usecases/usecase.dart';
import 'package:mobile/core/utils/validators.dart';
import 'package:mobile/features/auth/domain/entities/auth_session.dart';
import 'package:mobile/features/auth/domain/repositories/auth_repository.dart';

class RegisterParams {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final List<String> roles;

  const RegisterParams({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.roles,
  });
}

class RegisterUseCase implements UseCase<AuthSession, RegisterParams> {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, AuthSession>> call(RegisterParams params) async {
    final nameError = validateName(params.name);
    if (nameError != null) {
      return Left(nameError);
    }

    final emailError = validateEmail(params.email);
    if (emailError != null) {
      return Left(emailError);
    }

    final passwordError = validatePasswordStrength(params.password);
    if (passwordError != null) {
      return Left(passwordError);
    }

    final confirmError = validateConfirmPassword(
      params.confirmPassword,
      password: params.password,
    );
    if (confirmError != null) {
      return Left(confirmError);
    }

    final rolesError = validateRoles(params.roles);
    if (rolesError != null) {
      return Left(rolesError);
    }

    return repository.register(
      name: params.name.trim(),
      email: params.email.trim(),
      password: params.password,
      confirmPassword: params.confirmPassword,
      roles: params.roles,
    );
  }
}
