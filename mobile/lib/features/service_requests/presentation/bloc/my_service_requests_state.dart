import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_summary.dart';

part 'my_service_requests_state.freezed.dart';

@freezed
sealed class MyServiceRequestsState with _$MyServiceRequestsState {
  const factory MyServiceRequestsState.initial() = MyServiceRequestsInitial;

  const factory MyServiceRequestsState.loading() = MyServiceRequestsLoading;

  const factory MyServiceRequestsState.loaded({
    required List<ServiceRequestSummary> requests,
  }) = MyServiceRequestsLoaded;

  const factory MyServiceRequestsState.empty() = MyServiceRequestsEmpty;

  const factory MyServiceRequestsState.failure({
    required String message,
  }) = MyServiceRequestsFailure;
}
