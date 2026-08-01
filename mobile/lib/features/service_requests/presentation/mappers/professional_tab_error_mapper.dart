import 'package:mobile/core/error/failures.dart';

String mapProfessionalTabErrorMessage(Failure failure) {
  return switch (failure.code) {
    'ACTIVE_CONTRACT_BLOCKS_REVOKE_ENGAGEMENT' =>
      failure.message.isNotEmpty
          ? failure.message
          : 'Tenés un contrato en curso. Para cambiar de profesional, primero cancelá el contrato vigente.',
    'NO_ASSIGNED_PROFESSIONAL' =>
      failure.message.isNotEmpty
          ? failure.message
          : 'Este pedido no tiene un profesional asignado.',
    'SERVICE_REQUEST_CANCELLED' =>
      failure.message.isNotEmpty
          ? failure.message
          : 'No podés modificar la contratación de un pedido cancelado.',
    'ACCEPTED_APPLICATION_NOT_FOUND' =>
      'No se encontró la postulación del profesional asignado',
    'NETWORK_ERROR' => 'No se pudo conectar con el servidor',
    _ => failure.message.isNotEmpty
        ? failure.message
        : 'Ocurrió un error. Intentá de nuevo',
  };
}

const String professionalTabComingSoonMessage = 'Próximamente';
