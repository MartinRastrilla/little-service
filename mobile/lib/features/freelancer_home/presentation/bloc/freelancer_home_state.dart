import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/freelancer_home/domain/entities/open_service_request_date_filter.dart';
import 'package:mobile/features/freelancer_home/domain/entities/open_service_request_summary.dart';

part 'freelancer_home_state.freezed.dart';

@freezed
sealed class FreelancerHomeState with _$FreelancerHomeState {
  const factory FreelancerHomeState.initial() = FreelancerHomeInitial;

  const factory FreelancerHomeState.loading() = FreelancerHomeLoading;

  const factory FreelancerHomeState.loaded({
    required List<OpenServiceRequestSummary> requests,
    required OpenServiceRequestDateFilter currentFilter,
    String? currentSearch,
    @Default(false) bool isFilteredOrSearched,
  }) = FreelancerHomeLoaded;

  const factory FreelancerHomeState.empty({
    required OpenServiceRequestDateFilter currentFilter,
    String? currentSearch,
    @Default(false) bool isFilteredOrSearched,
  }) = FreelancerHomeEmpty;

  const factory FreelancerHomeState.failure({
    required String message,
  }) = FreelancerHomeFailure;
}
