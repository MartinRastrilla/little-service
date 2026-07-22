import 'package:freezed_annotation/freezed_annotation.dart';

part 'freelancer_public_profile_event.freezed.dart';

@freezed
sealed class FreelancerPublicProfileEvent with _$FreelancerPublicProfileEvent {
  const factory FreelancerPublicProfileEvent.requested({
    required String freelancerId,
  }) = FreelancerPublicProfileRequested;
}
