import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';

class ShellHeader extends StatelessWidget {
  final String userName;

  const ShellHeader({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Hola, $userName',
          style: context.text.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: context.colors.onSurface,
          ),
        ),
      ),
    );
  }
}
