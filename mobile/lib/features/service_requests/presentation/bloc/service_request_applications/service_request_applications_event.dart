import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_application.dart';

part 'service_request_applications_event.freezed.dart';

@freezed
sealed class ServiceRequestApplicationsEvent
    with _$ServiceRequestApplicationsEvent {
  const factory ServiceRequestApplicationsEvent.started({
    required String serviceRequestId,
  }) = ServiceRequestApplicationsStarted;

  const factory ServiceRequestApplicationsEvent.filterChanged({
    required ServiceRequestApplicationFilter filter,
  }) = ServiceRequestApplicationsFilterChanged;

  const factory ServiceRequestApplicationsEvent.refreshRequested() =
      ServiceRequestApplicationsRefreshRequested;

  const factory ServiceRequestApplicationsEvent.acceptRequested({
    required String applicationId,
    required String freelancerName,
  }) = ServiceRequestApplicationsAcceptRequested;

  const factory ServiceRequestApplicationsEvent.rejectRequested({
    required String applicationId,
    required String freelancerName,
  }) = ServiceRequestApplicationsRejectRequested;
}
