import 'package:mobile/features/service_requests/domain/entities/service_request_photo_input.dart';

class CreateServiceRequestParams {
  final String title;
  final String description;
  final String location;
  final double? price;
  final List<ServiceRequestPhotoInput> photos;

  const CreateServiceRequestParams({
    required this.title,
    required this.description,
    required this.location,
    required this.price,
    required this.photos,
  });
}
