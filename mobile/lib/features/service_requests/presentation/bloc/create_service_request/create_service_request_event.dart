import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_photo_input.dart';

part 'create_service_request_event.freezed.dart';

@freezed
sealed class CreateServiceRequestEvent with _$CreateServiceRequestEvent {
  const factory CreateServiceRequestEvent.started() =
      CreateServiceRequestStarted;

  const factory CreateServiceRequestEvent.stepOneSubmitted({
    required String title,
    required String description,
  }) = CreateServiceRequestStepOneSubmitted;

  const factory CreateServiceRequestEvent.stepTwoSubmitted({
    required String location,
    double? price,
  }) = CreateServiceRequestStepTwoSubmitted;

  const factory CreateServiceRequestEvent.stepThreeSubmitted({
    required List<ServiceRequestPhotoInput> photos,
  }) = CreateServiceRequestStepThreeSubmitted;

  const factory CreateServiceRequestEvent.backRequested() =
      CreateServiceRequestBackRequested;

  const factory CreateServiceRequestEvent.resetRequested() =
      CreateServiceRequestResetRequested;
}
