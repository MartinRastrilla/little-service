import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_state.dart';
import 'package:mobile/features/auth/presentation/pages/home_page.dart';
import 'package:mobile/features/auth/presentation/pages/login_page.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

class AppRouter {
  AppRouter({required AuthBloc authBloc})
    : router = GoRouter(
        initialLocation: '/login',
        refreshListenable: GoRouterRefreshStream(authBloc.stream),
        redirect: (context, state) {
          final authState = authBloc.state;
          final isLoggingIn = state.matchedLocation == '/login';

          return authState.maybeWhen(
            authenticated: (_) => isLoggingIn ? '/home' : null,
            unauthenticated: () => isLoggingIn ? null : '/login',
            orElse: () => null,
          );
        },
        routes: [
          GoRoute(
            path: '/login',
            builder: (context, state) => const LoginPage(),
          ),
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomePage(),
          ),
        ],
      );

  final GoRouter router;
}
