import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/freelancer_my_work/domain/entities/freelancer_work_item.dart';

part 'freelancer_my_work_state.freezed.dart';

@freezed
sealed class FreelancerMyWorkState with _$FreelancerMyWorkState {
  const factory FreelancerMyWorkState.initial() = FreelancerMyWorkInitial;

  const factory FreelancerMyWorkState.loading({
    required FreelancerMyWorkTab tab,
    required FreelancerApplicationFilter applicationFilter,
    required FreelancerJobFilter jobFilter,
  }) = FreelancerMyWorkLoading;

  const factory FreelancerMyWorkState.loaded({
    required FreelancerMyWorkTab tab,
    required FreelancerApplicationFilter applicationFilter,
    required FreelancerJobFilter jobFilter,
    required List<FreelancerWorkItem> applications,
    required List<FreelancerWorkItem> jobs,
  }) = FreelancerMyWorkLoaded;

  const factory FreelancerMyWorkState.empty({
    required FreelancerMyWorkTab tab,
    required FreelancerApplicationFilter applicationFilter,
    required FreelancerJobFilter jobFilter,
  }) = FreelancerMyWorkEmpty;

  const factory FreelancerMyWorkState.failure({
    required FreelancerMyWorkTab tab,
    required FreelancerApplicationFilter applicationFilter,
    required FreelancerJobFilter jobFilter,
    required String message,
  }) = FreelancerMyWorkFailure;
}
