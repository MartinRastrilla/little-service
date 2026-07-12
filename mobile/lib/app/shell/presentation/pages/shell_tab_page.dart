import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/app/shell/presentation/config/shell_tab_definition.dart';
import 'package:mobile/app/shell/presentation/config/shell_tabs_resolver.dart';
import 'package:mobile/app/shell/presentation/pages/shell_placeholder_page.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_state.dart';

class ShellTabPage extends StatelessWidget {
  final ShellTabId tabId;

  const ShellTabPage({super.key, required this.tabId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state.maybeWhen(
          authenticated: (session) {
            final tabs = resolveShellTabs(session.user);
            final tab = findShellTab(tabs, tabId);

            if (tab == null) {
              return const SizedBox.shrink();
            }

            final title = tab.usesWelcomeTitle
                ? 'Bienvenido, ${session.user.name}'
                : tab.placeholderTitle;

            // TODO(tech-debt): Replace with actual ${tab.placeholderTitle} screen and navigation.
            return ShellPlaceholderPage(
              icon: tab.selectedIcon,
              title: title,
              description: tab.placeholderDescription,
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
