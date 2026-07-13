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

const int minNameLength = 2;
const int maxNameLength = 200;
const int minPasswordLength = 8;
const int maxPasswordLength = 28;

const String passwordRequirementsHint =
    'Mínimo 8 caracteres, máximo 28. Debe incluir mayúscula, minúscula y número.';

ValidationFailure? validateName(String? value) {
  if (value == null || value.trim().isEmpty) {
    return const ValidationFailure(
      'El nombre no puede estar vacío',
      code: 'NAME_EMPTY',
    );
  }

  final trimmedName = value.trim();

  if (trimmedName.length < minNameLength) {
    return ValidationFailure(
      'El nombre debe tener al menos $minNameLength caracteres',
      code: 'NAME_TOO_SHORT',
    );
  }

  if (trimmedName.length > maxNameLength) {
    return ValidationFailure(
      'El nombre no puede tener más de $maxNameLength caracteres',
      code: 'NAME_TOO_LONG',
    );
  }

  if (trimmedName.runes.every((rune) {
    final char = String.fromCharCode(rune);
    return int.tryParse(char) != null;
  })) {
    return const ValidationFailure(
      'El nombre no puede contener solo números',
      code: 'NAME_ONLY_NUMBERS',
    );
  }

  return null;
}

ValidationFailure? validatePasswordStrength(String? value) {
  if (value == null || value.isEmpty) {
    return const ValidationFailure(
      'La contraseña no puede estar vacía',
      code: 'PASSWORD_EMPTY',
    );
  }

  if (value.length < minPasswordLength) {
    return ValidationFailure(
      'La contraseña debe tener al menos $minPasswordLength caracteres',
      code: 'PASSWORD_TOO_SHORT',
    );
  }

  if (value.length > maxPasswordLength) {
    return ValidationFailure(
      'La contraseña no puede tener más de $maxPasswordLength caracteres',
      code: 'PASSWORD_TOO_LONG',
    );
  }

  if (!value.contains(RegExp(r'[A-Z]'))) {
    return const ValidationFailure(
      'La contraseña debe contener al menos una letra mayúscula',
      code: 'PASSWORD_NO_UPPERCASE',
    );
  }

  if (!value.contains(RegExp(r'[a-z]'))) {
    return const ValidationFailure(
      'La contraseña debe contener al menos una letra minúscula',
      code: 'PASSWORD_NO_LOWERCASE',
    );
  }

  if (!value.contains(RegExp(r'[0-9]'))) {
    return const ValidationFailure(
      'La contraseña debe contener al menos un número',
      code: 'PASSWORD_NO_DIGIT',
    );
  }

  return null;
}

ValidationFailure? validateConfirmPassword(
  String? value, {
  required String password,
}) {
  if (value == null || value.isEmpty) {
    return const ValidationFailure(
      'Debes confirmar la contraseña',
      code: 'PASSWORD_CONFIRM_REQUIRED',
    );
  }

  if (value != password) {
    return const ValidationFailure(
      'Las contraseñas no coinciden',
      code: 'PASSWORDS_DONT_MATCH',
    );
  }

  return null;
}

ValidationFailure? validateRoles(List<String> roles) {
  if (roles.isEmpty) {
    return const ValidationFailure(
      'Debe especificar al menos un rol',
      code: 'NO_ROLES_SPECIFIED',
    );
  }

  return null;
}
