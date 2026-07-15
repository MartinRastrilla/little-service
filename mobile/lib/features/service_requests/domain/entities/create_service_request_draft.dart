import 'package:mobile/features/service_requests/domain/entities/service_request_photo_input.dart';

class CreateServiceRequestDraft {
  final String title;
  final String description;
  final String location;
  final double? price;
  final List<ServiceRequestPhotoInput> photos;

  const CreateServiceRequestDraft({
    this.title = '',
    this.description = '',
    this.location = '',
    this.price,
    this.photos = const [],
  });

  CreateServiceRequestDraft copyWith({
    String? title,
    String? description,
    String? location,
    double? price,
    bool clearPrice = false,
    List<ServiceRequestPhotoInput>? photos,
  }) {
    return CreateServiceRequestDraft(
      title: title ?? this.title,
      description: description ?? this.description,
      location: location ?? this.location,
      price: clearPrice ? null : (price ?? this.price),
      photos: photos ?? this.photos,
    );
  }
}
