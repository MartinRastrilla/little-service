import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/freelancer_my_work/domain/entities/freelancer_work_item.dart';

part 'freelancer_my_work_event.freezed.dart';

@freezed
sealed class FreelancerMyWorkEvent with _$FreelancerMyWorkEvent {
  const factory FreelancerMyWorkEvent.started({
    FreelancerMyWorkTab? initialTab,
  }) = FreelancerMyWorkStarted;

  const factory FreelancerMyWorkEvent.tabChanged({
    required FreelancerMyWorkTab tab,
  }) = FreelancerMyWorkTabChanged;

  const factory FreelancerMyWorkEvent.applicationFilterChanged({
    required FreelancerApplicationFilter filter,
  }) = FreelancerMyWorkApplicationFilterChanged;

  const factory FreelancerMyWorkEvent.jobFilterChanged({
    required FreelancerJobFilter filter,
  }) = FreelancerMyWorkJobFilterChanged;

  const factory FreelancerMyWorkEvent.retry() = FreelancerMyWorkRetry;
}
