import 'package:mobile/core/error/exceptions.dart';
import 'package:mobile/core/error/failures.dart';

String mapChatErrorMessage(Failure failure) {
  return switch (failure.code) {
    'WAITING_FOR_CLIENT_MESSAGE' =>
      failure.message.isNotEmpty
          ? failure.message
          : 'Debés recibir un mensaje del cliente antes de poder responder.',
    'SERVICE_REQUEST_READ_ONLY' =>
      failure.message.isNotEmpty
          ? failure.message
          : 'El pedido está cerrado o cancelado. Solo podés leer el historial.',
    'APPLICATION_REJECTED_READ_ONLY' =>
      failure.message.isNotEmpty
          ? failure.message
          : 'La postulación fue rechazada. Solo podés leer el historial.',
    'NETWORK_ERROR' => 'No se pudo conectar con el servidor',
    _ => failure.message,
  };
}

String mapChatExceptionMessage(ApiException exception) {
  final message = exception.message ?? '';
  return switch (exception.code) {
    'WAITING_FOR_CLIENT_MESSAGE' =>
      message.isNotEmpty
          ? message
          : 'Debés recibir un mensaje del cliente antes de poder responder.',
    'SERVICE_REQUEST_READ_ONLY' =>
      message.isNotEmpty
          ? message
          : 'El pedido está cerrado o cancelado. Solo podés leer el historial.',
    'NETWORK_ERROR' => 'No se pudo conectar con el servidor',
    _ => message.isNotEmpty ? message : 'Error de servidor',
  };
}
