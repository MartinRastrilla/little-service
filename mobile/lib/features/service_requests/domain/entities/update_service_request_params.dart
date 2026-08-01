import 'package:mobile/features/service_requests/domain/entities/service_request_photo_input.dart';

class UpdateServiceRequestParams {
  final String serviceRequestId;
  final String title;
  final String description;
  final String location;
  final double? price;
  final bool clearPrice;
  final List<String> deletedPhotoIds;
  final List<ServiceRequestPhotoInput> newPhotos;

  const UpdateServiceRequestParams({
    required this.serviceRequestId,
    required this.title,
    required this.description,
    required this.location,
    required this.price,
    required this.clearPrice,
    required this.deletedPhotoIds,
    required this.newPhotos,
  });
}
