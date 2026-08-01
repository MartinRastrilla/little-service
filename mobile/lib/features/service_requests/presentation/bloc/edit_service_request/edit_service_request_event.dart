import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_info.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_photo_input.dart';

part 'edit_service_request_event.freezed.dart';

@freezed
sealed class EditServiceRequestEvent with _$EditServiceRequestEvent {
  const factory EditServiceRequestEvent.started({
    required String serviceRequestId,
  }) = EditServiceRequestStarted;

  const factory EditServiceRequestEvent.fieldChanged({
    String? title,
    String? description,
    String? location,
  }) = EditServiceRequestFieldChanged;

  const factory EditServiceRequestEvent.budgetModeChanged({
    required ServiceRequestPriceMode priceMode,
    double? price,
  }) = EditServiceRequestBudgetModeChanged;

  const factory EditServiceRequestEvent.photosChanged({
    required List<String> deletedPhotoIds,
    required List<ServiceRequestPhotoInput> newPhotos,
  }) = EditServiceRequestPhotosChanged;

  const factory EditServiceRequestEvent.saveRequested({
    required String title,
    required String description,
    required String location,
    required ServiceRequestPriceMode priceMode,
    double? price,
  }) = EditServiceRequestSaveRequested;

  const factory EditServiceRequestEvent.cancelRequested() =
      EditServiceRequestCancelRequested;
}
