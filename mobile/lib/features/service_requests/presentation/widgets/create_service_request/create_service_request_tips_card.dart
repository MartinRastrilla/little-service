import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';

class CreateServiceRequestTipsCard extends StatelessWidget {
  const CreateServiceRequestTipsCard({super.key});

  static const _tips = [
    'Describe el problema o trabajo que necesitas.',
    'Menciona medidas, marcas o materiales si los conoces.',
    'Cuanta más información, mejores resultados.',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.primaryContainer.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: context.colors.secondary.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.lightbulb_outline,
              color: context.colors.secondary,
              size: 22,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Consejos útiles',
                  style: context.text.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.colors.secondary,
                  ),
                ),
                const SizedBox(height: 12),
                for (final tip in _tips) ...[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        size: 16,
                        color: context.colors.secondary,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          tip,
                          style: context.text.bodySmall?.copyWith(
                            color: context.colors.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (tip != _tips.last) const SizedBox(height: 8),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
