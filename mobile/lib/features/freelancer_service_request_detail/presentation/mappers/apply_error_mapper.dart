import 'package:mobile/core/error/failures.dart';

String mapApplyErrorMessage(Failure failure) {
  return switch (failure.code) {
    'ALREADY_APPLIED' => 'Ya te postulaste a este trabajo',
    'SERVICE_REQUEST_ALREADY_HAS_FREELANCER' =>
      'Este trabajo ya no acepta postulaciones',
    'SERVICE_REQUEST_NOT_OPENED' => 'Este trabajo ya no está disponible',
    'FREELANCER_IS_CLIENT' => 'No podés postularte a tu propio trabajo',
    'NETWORK_ERROR' => 'No se pudo conectar con el servidor',
    _ => 'Ocurrió un error al postularte. Intentá de nuevo',
  };
}

enum DetailApplyButtonState {
  canApply,
  alreadyApplied,
  unavailable,
}

DetailApplyButtonState resolveApplyButtonState({
  required bool canApply,
  required bool hasApplied,
  required String? applicationStatus,
}) {
  if (canApply) return DetailApplyButtonState.canApply;

  if (hasApplied && applicationStatus?.toLowerCase() == 'pending') {
    return DetailApplyButtonState.alreadyApplied;
  }

  return DetailApplyButtonState.unavailable;
}

String resolveApplyButtonLabel(DetailApplyButtonState state) {
  return switch (state) {
    DetailApplyButtonState.canApply => 'Postularme a este trabajo',
    DetailApplyButtonState.alreadyApplied => 'Ya te postulaste',
    DetailApplyButtonState.unavailable =>
      'Trabajo ya no acepta postulaciones',
  };
}

String extractInitials(String name) {
  final trimmed = name.trim();
  if (trimmed.isEmpty) return '?';

  final parts = trimmed.split(RegExp(r'\s+'));
  if (parts.length == 1) {
    return parts.first[0].toUpperCase();
  }

  return (parts.first[0] + parts.last[0]).toUpperCase();
}
