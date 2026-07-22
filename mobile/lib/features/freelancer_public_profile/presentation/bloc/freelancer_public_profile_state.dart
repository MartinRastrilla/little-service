import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/freelancer_public_profile/domain/entities/freelancer_public_profile.dart';

part 'freelancer_public_profile_state.freezed.dart';

@freezed
sealed class FreelancerPublicProfileState with _$FreelancerPublicProfileState {
  const factory FreelancerPublicProfileState.initial() =
      FreelancerPublicProfileInitial;

  const factory FreelancerPublicProfileState.loading() =
      FreelancerPublicProfileLoading;

  const factory FreelancerPublicProfileState.loaded({
    required FreelancerPublicProfile profile,
  }) = FreelancerPublicProfileLoaded;

  const factory FreelancerPublicProfileState.failure({
    required String message,
  }) = FreelancerPublicProfileFailure;
}
