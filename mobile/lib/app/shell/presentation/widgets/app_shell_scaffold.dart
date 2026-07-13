import 'package:flutter/material.dart';
import 'package:mobile/app/shell/presentation/config/shell_tab_definition.dart';
import 'package:mobile/app/shell/presentation/widgets/app_bottom_navigation_bar.dart';
import 'package:mobile/app/shell/presentation/widgets/shell_header.dart';

class AppShellScaffold extends StatelessWidget {
  final List<ShellTabDefinition> tabs;
  final int currentIndex;
  final String userName;
  final Widget body;
  final ValueChanged<int> onDestinationSelected;

  const AppShellScaffold({
    super.key,
    required this.tabs,
    required this.currentIndex,
    required this.userName,
    required this.body,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ShellHeader(userName: userName),
          Expanded(child: body),
        ],
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        tabs: tabs,
        currentIndex: currentIndex,
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}
