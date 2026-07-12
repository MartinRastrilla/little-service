import 'package:flutter/material.dart';
import 'package:mobile/app/shell/presentation/config/shell_tab_definition.dart';
import 'package:mobile/app/shell/presentation/widgets/app_bottom_navigation_bar.dart';

class AppShellScaffold extends StatelessWidget {
  final List<ShellTabDefinition> tabs;
  final int currentIndex;
  final Widget body;
  final ValueChanged<int> onDestinationSelected;
  final VoidCallback? onLogout;

  const AppShellScaffold({
    super.key,
    required this.tabs,
    required this.currentIndex,
    required this.body,
    required this.onDestinationSelected,
    this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    final currentTab = tabs[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(currentTab.label),
        actions: [
          // TODO: Move logout to More tab screen.
          if (onLogout != null)
            IconButton(
              tooltip: 'Cerrar sesión',
              onPressed: onLogout,
              icon: const Icon(Icons.logout),
            ),
        ],
      ),
      body: body,
      bottomNavigationBar: AppBottomNavigationBar(
        tabs: tabs,
        currentIndex: currentIndex,
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}
