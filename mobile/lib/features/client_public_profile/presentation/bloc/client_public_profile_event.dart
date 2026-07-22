import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_public_profile_event.freezed.dart';

@freezed
sealed class ClientPublicProfileEvent with _$ClientPublicProfileEvent {
  const factory ClientPublicProfileEvent.requested({
    required String clientId,
  }) = ClientPublicProfileRequested;
}
