import 'package:mobile/core/error/failures.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_photo_input.dart';

const int maxServiceRequestPhotos = 5;
const int maxServiceRequestPhotoSizeBytes = 5 * 1024 * 1024;

const _allowedPhotoExtensions = {'.jpg', '.jpeg', '.png', '.webp'};

ValidationFailure? validateServiceRequestTitle(String? value) {
  if (value == null || value.trim().isEmpty) {
    return const ValidationFailure(
      'El título es obligatorio',
      code: 'TITLE_REQUIRED',
    );
  }

  if (value.trim().length > 200) {
    return const ValidationFailure(
      'El título no puede superar los 200 caracteres',
      code: 'TITLE_TOO_LONG',
    );
  }

  return null;
}

ValidationFailure? validateServiceRequestDescription(String? value) {
  if (value == null || value.trim().isEmpty) {
    return const ValidationFailure(
      'La descripción es obligatoria',
      code: 'DESCRIPTION_REQUIRED',
    );
  }

  if (value.trim().length > 2000) {
    return const ValidationFailure(
      'La descripción no puede superar los 2000 caracteres',
      code: 'DESCRIPTION_TOO_LONG',
    );
  }

  return null;
}

ValidationFailure? validateServiceRequestLocation(String? value) {
  if (value == null || value.trim().isEmpty) {
    return const ValidationFailure(
      'La ubicación es obligatoria',
      code: 'LOCATION_REQUIRED',
    );
  }

  if (value.trim().length > 500) {
    return const ValidationFailure(
      'La ubicación no puede superar los 500 caracteres',
      code: 'LOCATION_TOO_LONG',
    );
  }

  return null;
}

ValidationFailure? validateServiceRequestPrice(double? value) {
  if (value == null) return null;

  if (value <= 0) {
    return const ValidationFailure(
      'El precio debe ser mayor a cero',
      code: 'INVALID_PRICE',
    );
  }

  return null;
}

ValidationFailure? validateServiceRequestPhotoFile({
  required String fileName,
  required int length,
}) {
  final extension = _extensionOf(fileName);
  if (!_allowedPhotoExtensions.contains(extension)) {
    return const ValidationFailure(
      'Solo se permiten imágenes JPG, JPEG, PNG o WebP',
      code: 'INVALID_PHOTO_TYPE',
    );
  }

  if (length > maxServiceRequestPhotoSizeBytes) {
    return const ValidationFailure(
      'Cada imagen no puede superar los 5 MB',
      code: 'PHOTO_TOO_LARGE',
    );
  }

  return null;
}

ValidationFailure? validateServiceRequestPhotos(
  List<ServiceRequestPhotoInput> photos,
) {
  if (photos.length > maxServiceRequestPhotos) {
    return ValidationFailure(
      'Se permiten como máximo $maxServiceRequestPhotos fotos',
      code: 'TOO_MANY_PHOTOS',
    );
  }

  for (final photo in photos) {
    final extension = _extensionOf(photo.fileName);
    if (!_allowedPhotoExtensions.contains(extension)) {
      return const ValidationFailure(
        'Solo se permiten imágenes JPG, JPEG, PNG o WebP',
        code: 'INVALID_PHOTO_TYPE',
      );
    }

    if (photo.length > maxServiceRequestPhotoSizeBytes) {
      return const ValidationFailure(
        'Cada imagen no puede superar los 5 MB',
        code: 'PHOTO_TOO_LARGE',
      );
    }
  }

  return null;
}

String _extensionOf(String fileName) {
  final dotIndex = fileName.lastIndexOf('.');
  if (dotIndex == -1) return '';
  return fileName.substring(dotIndex).toLowerCase();
}
