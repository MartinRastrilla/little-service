import 'package:mobile/core/error/failures.dart';

ValidationFailure? validateEmail(String? value) {
  if (value == null || value.trim().isEmpty) {
    return const ValidationFailure(
      'El email es obligatorio',
      code: 'EMAIL_REQUIRED',
    );
  }

  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
  if (!emailRegex.hasMatch(value.trim())) {
    return const ValidationFailure(
      'Ingresa un email válido',
      code: 'EMAIL_INVALID',
    );
  }

  return null;
}

ValidationFailure? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return const ValidationFailure(
      'La contraseña es obligatoria',
      code: 'PASSWORD_REQUIRED',
    );
  }

  return null;
}
