import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';

class ShellPlaceholderPage extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const ShellPlaceholderPage({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: context.colors.primaryContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 36,
                color: context.colors.primary,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: context.text.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: context.colors.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Próximamente',
              style: context.text.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: context.colors.secondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: context.text.bodyMedium?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
