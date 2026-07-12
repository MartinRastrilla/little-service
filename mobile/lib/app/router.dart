import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/app/shell/presentation/app_shell_page.dart';
import 'package:mobile/app/shell/presentation/config/shell_tab_definition.dart';
import 'package:mobile/app/shell/presentation/pages/shell_tab_page.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_state.dart';
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
          final location = state.matchedLocation;
          final isLoggingIn = location == '/login';
          final isLegacyHome = location == '/home';

          return authState.maybeWhen(
            authenticated: (_) {
              if (isLoggingIn || isLegacyHome) return '/shell/home';
              return null;
            },
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
            redirect: (context, state) => '/shell/home',
          ),
          StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) {
              return AppShellPage(navigationShell: navigationShell);
            },
            branches: [
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/shell/home',
                    builder: (context, state) =>
                        const ShellTabPage(tabId: ShellTabId.home),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/shell/activity',
                    builder: (context, state) =>
                        const ShellTabPage(tabId: ShellTabId.activity),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/shell/messages',
                    builder: (context, state) =>
                        const ShellTabPage(tabId: ShellTabId.messages),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/shell/more',
                    builder: (context, state) =>
                        const ShellTabPage(tabId: ShellTabId.more),
                  ),
                ],
              ),
            ],
          ),
        ],
      );

  final GoRouter router;
}
