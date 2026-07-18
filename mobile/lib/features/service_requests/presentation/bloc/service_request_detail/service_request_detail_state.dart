import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_activity.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_info.dart';
import 'package:mobile/features/service_requests/presentation/bloc/service_request_detail/activity_load_status.dart';

part 'service_request_detail_state.freezed.dart';

@freezed
sealed class ServiceRequestDetailState with _$ServiceRequestDetailState {
  const factory ServiceRequestDetailState.initial() =
      ServiceRequestDetailInitial;

  const factory ServiceRequestDetailState.loading() =
      ServiceRequestDetailLoading;

  const factory ServiceRequestDetailState.loaded({
    required ServiceRequestInfo info,
    ServiceRequestActivity? activity,
    @Default(ActivityLoadStatus.initial) ActivityLoadStatus activityStatus,
    String? activityErrorMessage,
  }) = ServiceRequestDetailLoaded;

  const factory ServiceRequestDetailState.failure({
    required String message,
  }) = ServiceRequestDetailFailure;
}
