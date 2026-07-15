import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_filter_option.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_summary.dart';

part 'my_service_requests_state.freezed.dart';

@freezed
sealed class MyServiceRequestsState with _$MyServiceRequestsState {
  const factory MyServiceRequestsState.initial() = MyServiceRequestsInitial;

  const factory MyServiceRequestsState.loading() = MyServiceRequestsLoading;

  const factory MyServiceRequestsState.loadingMore({
    required List<ServiceRequestSummary> requests,
    required ServiceRequestFilterOption currentFilter,
    String? currentSearch,
    required int totalCount,
    required bool hasMore,
    required int currentPage,
  }) = MyServiceRequestsLoadingMore;

  const factory MyServiceRequestsState.loaded({
    required List<ServiceRequestSummary> requests,
    required ServiceRequestFilterOption currentFilter,
    String? currentSearch,
    required int totalCount,
    required bool hasMore,
    required int currentPage,
    @Default(false) bool isFilteredOrSearched,
  }) = MyServiceRequestsLoaded;

  const factory MyServiceRequestsState.empty({
    required ServiceRequestFilterOption currentFilter,
    String? currentSearch,
    @Default(false) bool isFilteredOrSearched,
  }) = MyServiceRequestsEmpty;

  const factory MyServiceRequestsState.failure({
    required String message,
  }) = MyServiceRequestsFailure;
}
