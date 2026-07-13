import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkRequested() = AuthCheckRequested;

  const factory AuthEvent.loginRequested({
    required String email,
    required String password,
  }) = AuthLoginRequested;

  const factory AuthEvent.registerRequested({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required List<String> roles,
  }) = AuthRegisterRequested;

  const factory AuthEvent.logoutRequested() = AuthLogoutRequested;

  const factory AuthEvent.sessionExpired() = AuthSessionExpired;
}
