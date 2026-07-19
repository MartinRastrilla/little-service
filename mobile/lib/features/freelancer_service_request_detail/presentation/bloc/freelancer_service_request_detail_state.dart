import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/freelancer_service_request_detail/domain/entities/open_service_request_detail.dart';

part 'freelancer_service_request_detail_state.freezed.dart';

@freezed
sealed class FreelancerServiceRequestDetailState
    with _$FreelancerServiceRequestDetailState {
  const factory FreelancerServiceRequestDetailState.initial() =
      FreelancerServiceRequestDetailInitial;

  const factory FreelancerServiceRequestDetailState.loading() =
      FreelancerServiceRequestDetailLoading;

  const factory FreelancerServiceRequestDetailState.loaded({
    required OpenServiceRequestDetail detail,
  }) = FreelancerServiceRequestDetailLoaded;

  const factory FreelancerServiceRequestDetailState.applying({
    required OpenServiceRequestDetail detail,
  }) = FreelancerServiceRequestDetailApplying;

  const factory FreelancerServiceRequestDetailState.applySuccess() =
      FreelancerServiceRequestDetailApplySuccess;

  const factory FreelancerServiceRequestDetailState.failure({
    required String message,
    OpenServiceRequestDetail? detail,
  }) = FreelancerServiceRequestDetailFailure;
}
