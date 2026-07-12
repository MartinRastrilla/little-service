import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/app/shell/presentation/config/shell_tabs_resolver.dart';
import 'package:mobile/app/shell/presentation/widgets/app_shell_scaffold.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_event.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_state.dart';

class AppShellPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AppShellPage({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          unauthenticated: () => context.go('/login'),
          failure: (message, _) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(message)));
          },
          orElse: () {},
        );
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return state.maybeWhen(
            authenticated: (session) {
              final tabs = resolveShellTabs(session.user);

              return AppShellScaffold(
                tabs: tabs,
                currentIndex: navigationShell.currentIndex,
                onDestinationSelected: (index) {
                  // TODO(tech-debt): Implement navigation to actual feature screens.
                  navigationShell.goBranch(
                    index,
                    initialLocation: index == navigationShell.currentIndex,
                  );
                },
                onLogout: () {
                  context.read<AuthBloc>().add(
                    const AuthEvent.logoutRequested(),
                  );
                },
                body: navigationShell,
              );
            },
            loading: () => const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
