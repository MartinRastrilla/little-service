import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';

class FreelancerHomeEmptyState extends StatelessWidget {
  final bool isFilteredOrSearched;

  const FreelancerHomeEmptyState({
    super.key,
    required this.isFilteredOrSearched,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.work_off_outlined,
              size: 48,
              color: context.colors.onSurfaceVariant.withValues(alpha: 0.6),
            ),
            const SizedBox(height: 16),
            Text(
              isFilteredOrSearched
                  ? 'No encontramos trabajos con estos filtros.'
                  : 'No hay trabajos disponibles por ahora.',
              textAlign: TextAlign.center,
              style: context.text.bodyLarge?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
