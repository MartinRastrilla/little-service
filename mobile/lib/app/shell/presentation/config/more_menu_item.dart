import 'package:flutter/material.dart';

class MoreMenuItemDefinition {
  final String id;
  final String label;
  final IconData icon;
  final bool isDestructive;

  const MoreMenuItemDefinition({
    required this.id,
    required this.label,
    required this.icon,
    this.isDestructive = false,
  });
}
