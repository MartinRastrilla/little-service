import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/client_public_profile/domain/entities/client_public_profile.dart';

part 'client_public_profile_state.freezed.dart';

@freezed
sealed class ClientPublicProfileState with _$ClientPublicProfileState {
  const factory ClientPublicProfileState.initial() = ClientPublicProfileInitial;

  const factory ClientPublicProfileState.loading() = ClientPublicProfileLoading;

  const factory ClientPublicProfileState.loaded({
    required ClientPublicProfile profile,
  }) = ClientPublicProfileLoaded;

  const factory ClientPublicProfileState.failure({
    required String message,
  }) = ClientPublicProfileFailure;
}
