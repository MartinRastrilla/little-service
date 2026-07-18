import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';

class FreelancerAdvancedFiltersFab extends StatelessWidget {
  const FreelancerAdvancedFiltersFab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: context.colors.surface,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              'Filtros',
              style: context.text.labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: context.colors.onSurface.withValues(alpha: 0.4),
              ),
            ),
          ),
          const SizedBox(width: 8),
          FloatingActionButton(
            onPressed: null,
            backgroundColor: context.colors.primary.withValues(alpha: 0.5),
            foregroundColor: context.colors.onPrimary.withValues(alpha: 0.7),
            child: const Icon(Icons.tune),
          ),
        ],
      ),
    );
  }
}
