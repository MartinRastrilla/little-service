import 'package:mobile/core/error/failures.dart';

String mapEditServiceRequestErrorMessage(Failure failure) {
  return switch (failure.code) {
    'SERVICE_REQUEST_NOT_EDITABLE' =>
      failure.message.isNotEmpty
          ? failure.message
          : 'Este pedido ya no se puede modificar',
    'ACTIVE_CONTRACT_BLOCKS_CANCEL' =>
      failure.message.isNotEmpty
          ? failure.message
          : 'Tenés un contrato en curso con este pedido. Para cancelarlo, primero cancelá el contrato vigente.',
    'SERVICE_REQUEST_NOT_OPENED' =>
      failure.message.isNotEmpty
          ? failure.message
          : 'Solo podés cancelar pedidos que siguen abiertos.',
    'TOO_MANY_PHOTOS' => 'Se permiten como máximo 5 fotos',
    'PHOTO_TOO_LARGE' => 'Cada imagen no puede superar los 5 MB',
    'INVALID_PHOTO_TYPE' => 'Solo se permiten imágenes JPG, JPEG, PNG o WebP',
    'INVALID_PRICE' => 'El precio debe ser mayor a cero',
    'INVALID_PRICE_UPDATE' => 'No se pudo actualizar el presupuesto',
    'PHOTO_NOT_FOUND' => 'Una de las fotos seleccionada ya no existe',
    'NETWORK_ERROR' => 'No se pudo conectar con el servidor',
    _ => failure.message.isNotEmpty
        ? failure.message
        : 'Ocurrió un error. Intentá de nuevo',
  };
}
