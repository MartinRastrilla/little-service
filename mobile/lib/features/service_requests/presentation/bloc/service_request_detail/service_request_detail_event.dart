import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_request_detail_event.freezed.dart';

@freezed
sealed class ServiceRequestDetailEvent with _$ServiceRequestDetailEvent {
  const factory ServiceRequestDetailEvent.requested({
    required String serviceRequestId,
  }) = ServiceRequestDetailRequested;

  const factory ServiceRequestDetailEvent.refreshRequested() =
      ServiceRequestDetailRefreshRequested;

  const factory ServiceRequestDetailEvent.activityRequested() =
      ServiceRequestDetailActivityRequested;

  const factory ServiceRequestDetailEvent.activityRefreshRequested() =
      ServiceRequestDetailActivityRefreshRequested;

  const factory ServiceRequestDetailEvent.professionalRequested() =
      ServiceRequestDetailProfessionalRequested;

  const factory ServiceRequestDetailEvent.professionalRefreshRequested() =
      ServiceRequestDetailProfessionalRefreshRequested;

  const factory ServiceRequestDetailEvent.revokeEngagementRequested() =
      ServiceRequestDetailRevokeEngagementRequested;
}
