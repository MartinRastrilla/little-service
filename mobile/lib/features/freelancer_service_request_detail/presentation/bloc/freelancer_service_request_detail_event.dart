import 'package:freezed_annotation/freezed_annotation.dart';

part 'freelancer_service_request_detail_event.freezed.dart';

@freezed
sealed class FreelancerServiceRequestDetailEvent
    with _$FreelancerServiceRequestDetailEvent {
  const factory FreelancerServiceRequestDetailEvent.requested({
    required String serviceRequestId,
  }) = FreelancerServiceRequestDetailRequested;

  const factory FreelancerServiceRequestDetailEvent.applyConfirmed({
    required String serviceRequestId,
  }) = FreelancerServiceRequestDetailApplyConfirmed;
}
