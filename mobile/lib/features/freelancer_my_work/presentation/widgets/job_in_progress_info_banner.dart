import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';

class JobInProgressInfoBanner extends StatelessWidget {
  const JobInProgressInfoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: context.colors.primaryContainer.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.info_outline,
            size: 18,
            color: context.colors.primary,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Trabajo en curso - El cliente puede ver tu progreso y enviarte mensajes.',
              style: context.text.bodySmall?.copyWith(
                color: context.colors.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
