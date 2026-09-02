import 'package:mobile/core/error/failures.dart';

const int maxContractTermsLength = 5000;

ValidationFailure? validateContractTerms(String? value) {
  if (value == null || value.trim().isEmpty) {
    return const ValidationFailure(
      'Los términos del contrato son obligatorios',
      code: 'TERMS_REQUIRED',
    );
  }

  if (value.trim().length > maxContractTermsLength) {
    return const ValidationFailure(
      'Los términos no pueden superar los 5000 caracteres',
      code: 'TERMS_TOO_LONG',
    );
  }

  return null;
}

ValidationFailure? validateContractAmount(double? value) {
  if (value == null || value <= 0) {
    return const ValidationFailure(
      'El monto debe ser mayor a cero',
      code: 'INVALID_AMOUNT',
    );
  }

  if (value > 999999999.99) {
    return const ValidationFailure(
      'El monto excede el máximo permitido',
      code: 'AMOUNT_TOO_HIGH',
    );
  }

  return null;
}

ValidationFailure? validateContractDates(DateTime? startDate, DateTime? endDate) {
  if (startDate == null || endDate == null) {
    return const ValidationFailure(
      'Las fechas de inicio y fin son obligatorias',
      code: 'DATES_REQUIRED',
    );
  }

  if (!endDate.isAfter(startDate)) {
    return const ValidationFailure(
      'La fecha de fin debe ser mayor a la fecha de inicio',
      code: 'INVALID_DATE_RANGE',
    );
  }

  return null;
}
