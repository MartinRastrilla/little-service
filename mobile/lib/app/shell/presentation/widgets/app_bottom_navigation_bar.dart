import 'package:flutter/material.dart';
import 'package:mobile/app/shell/presentation/config/shell_tab_definition.dart';

// TODO: Wire badge counts for Messages and Activity tabs.
class AppBottomNavigationBar extends StatelessWidget {
  final List<ShellTabDefinition> tabs;
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  const AppBottomNavigationBar({
    super.key,
    required this.tabs,
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: [
        for (final tab in tabs)
          NavigationDestination(
            icon: Icon(tab.icon),
            selectedIcon: Icon(tab.selectedIcon),
            label: tab.label,
          ),
      ],
    );
  }
}
