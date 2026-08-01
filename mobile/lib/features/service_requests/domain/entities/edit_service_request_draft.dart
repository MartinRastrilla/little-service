import 'package:mobile/features/service_requests/domain/entities/service_request_info.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_photo_input.dart';

class EditServiceRequestDraft {
  final String title;
  final String description;
  final String location;
  final double? price;
  final ServiceRequestPriceMode priceMode;
  final List<ServiceRequestInfoPhoto> existingPhotos;
  final List<String> deletedPhotoIds;
  final List<ServiceRequestPhotoInput> newPhotos;

  const EditServiceRequestDraft({
    required this.title,
    required this.description,
    required this.location,
    required this.price,
    required this.priceMode,
    required this.existingPhotos,
    this.deletedPhotoIds = const [],
    this.newPhotos = const [],
  });

  factory EditServiceRequestDraft.fromInfo(ServiceRequestInfo info) {
    return EditServiceRequestDraft(
      title: info.title,
      description: info.description,
      location: info.location,
      price: info.price,
      priceMode: info.priceMode,
      existingPhotos: info.photos,
    );
  }

  int get visibleExistingPhotoCount =>
      existingPhotos.where((photo) => !deletedPhotoIds.contains(photo.id)).length;

  int get totalPhotoCount => visibleExistingPhotoCount + newPhotos.length;

  bool isSameAs(EditServiceRequestDraft other) {
    return title == other.title &&
        description == other.description &&
        location == other.location &&
        priceMode == other.priceMode &&
        price == other.price &&
        _samePhotoIds(existingPhotos, other.existingPhotos) &&
        _sameStringList(deletedPhotoIds, other.deletedPhotoIds) &&
        _sameNewPhotos(newPhotos, other.newPhotos);
  }

  EditServiceRequestDraft copyWith({
    String? title,
    String? description,
    String? location,
    double? price,
    bool clearPrice = false,
    ServiceRequestPriceMode? priceMode,
    List<ServiceRequestInfoPhoto>? existingPhotos,
    List<String>? deletedPhotoIds,
    List<ServiceRequestPhotoInput>? newPhotos,
  }) {
    return EditServiceRequestDraft(
      title: title ?? this.title,
      description: description ?? this.description,
      location: location ?? this.location,
      price: clearPrice ? null : (price ?? this.price),
      priceMode: priceMode ?? this.priceMode,
      existingPhotos: existingPhotos ?? this.existingPhotos,
      deletedPhotoIds: deletedPhotoIds ?? this.deletedPhotoIds,
      newPhotos: newPhotos ?? this.newPhotos,
    );
  }

  static bool _samePhotoIds(
    List<ServiceRequestInfoPhoto> left,
    List<ServiceRequestInfoPhoto> right,
  ) {
    if (left.length != right.length) return false;
    for (var i = 0; i < left.length; i++) {
      if (left[i].id != right[i].id) return false;
    }
    return true;
  }

  static bool _sameStringList(List<String> left, List<String> right) {
    if (left.length != right.length) return false;
    for (var i = 0; i < left.length; i++) {
      if (left[i] != right[i]) return false;
    }
    return true;
  }

  static bool _sameNewPhotos(
    List<ServiceRequestPhotoInput> left,
    List<ServiceRequestPhotoInput> right,
  ) {
    if (left.length != right.length) return false;
    for (var i = 0; i < left.length; i++) {
      if (left[i].path != right[i].path) return false;
    }
    return true;
  }
}
