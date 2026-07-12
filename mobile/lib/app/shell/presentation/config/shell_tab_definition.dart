import 'package:flutter/material.dart';

enum ShellTabId { home, activity, messages, more }

class ShellTabDefinition {
  final ShellTabId id;
  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final String placeholderTitle;
  final String placeholderDescription;
  final bool usesWelcomeTitle;

  const ShellTabDefinition({
    required this.id,
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.placeholderTitle,
    required this.placeholderDescription,
    this.usesWelcomeTitle = false,
  });
}
