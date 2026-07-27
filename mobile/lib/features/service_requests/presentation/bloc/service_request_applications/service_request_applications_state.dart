import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_application.dart';

part 'service_request_applications_state.freezed.dart';

@freezed
sealed class ServiceRequestApplicationsState
    with _$ServiceRequestApplicationsState {
  const factory ServiceRequestApplicationsState.initial() =
      ServiceRequestApplicationsInitial;

  const factory ServiceRequestApplicationsState.loading({
    @Default(ServiceRequestApplicationFilter.pending)
    ServiceRequestApplicationFilter filter,
  }) = ServiceRequestApplicationsLoading;

  const factory ServiceRequestApplicationsState.loaded({
    required List<ServiceRequestApplication> applications,
    required List<ServiceRequestApplication> allApplications,
    required bool canManageApplications,
    required String serviceRequestTitle,
    required String serviceRequestDisplayStatus,
    required ServiceRequestApplicationFilter filter,
    String? actionInProgressApplicationId,
  }) = ServiceRequestApplicationsLoaded;

  const factory ServiceRequestApplicationsState.empty({
    required bool canManageApplications,
    required String serviceRequestTitle,
    required String serviceRequestDisplayStatus,
    required ServiceRequestApplicationFilter filter,
  }) = ServiceRequestApplicationsEmpty;

  const factory ServiceRequestApplicationsState.failure({
    required String message,
    required ServiceRequestApplicationFilter filter,
  }) = ServiceRequestApplicationsFailure;

  const factory ServiceRequestApplicationsState.actionSuccess({
    required bool accepted,
  }) = ServiceRequestApplicationsActionSuccess;
}
