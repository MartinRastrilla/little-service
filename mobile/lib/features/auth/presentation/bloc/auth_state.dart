import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/auth/domain/entities/auth_session.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;

  const factory AuthState.loading() = AuthLoading;

  const factory AuthState.authenticated({required AuthSession session}) =
      AuthAuthenticated;

  const factory AuthState.unauthenticated() = AuthUnauthenticated;

  const factory AuthState.failure({
    required String message,
    String? code,
  }) = AuthFailure;
}
