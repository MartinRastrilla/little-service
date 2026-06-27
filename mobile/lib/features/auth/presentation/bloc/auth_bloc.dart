import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/usecases/usecase.dart';
import 'package:mobile/features/auth/domain/usecases/check_session_usecase.dart';
import 'package:mobile/features/auth/domain/usecases/login_usecase.dart';
import 'package:mobile/features/auth/domain/usecases/logout_usecase.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_event.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;
  final CheckSessionUseCase checkSessionUseCase;

  AuthBloc({
    required this.loginUseCase,
    required this.logoutUseCase,
    required this.checkSessionUseCase,
  }) : super(const AuthState.initial()) {
    on<AuthCheckRequested>(_onCheckRequested);
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthLogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onCheckRequested(
    AuthCheckRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await checkSessionUseCase(const NoParams());
    result.fold(
      (_) => emit(const AuthState.unauthenticated()),
      (session) => emit(AuthState.authenticated(session: session)),
    );
  }

  Future<void> _onLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await loginUseCase(
      LoginParams(email: event.email, password: event.password),
    );

    result.fold(
      (failure) => emit(
        AuthState.failure(message: failure.message, code: failure.code),
      ),
      (session) => emit(AuthState.authenticated(session: session)),
    );
  }

  Future<void> _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await logoutUseCase(const NoParams());
    result.fold(
      (failure) => emit(
        AuthState.failure(message: failure.message, code: failure.code),
      ),
      (_) => emit(const AuthState.unauthenticated()),
    );
  }
}
