import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';

class AuthSectionDivider extends StatelessWidget {
  final String label;

  const AuthSectionDivider({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final lineColor = context.colors.outline;
    final textStyle = context.text.bodySmall?.copyWith(
      color: context.colors.onSurfaceVariant,
    );

    return Row(
      children: [
        Expanded(child: Divider(color: lineColor, thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(label, style: textStyle),
        ),
        Expanded(child: Divider(color: lineColor, thickness: 1)),
      ],
    );
  }
}
