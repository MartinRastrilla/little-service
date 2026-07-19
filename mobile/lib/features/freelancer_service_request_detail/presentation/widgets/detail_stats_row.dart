import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';

class DetailStatsRow extends StatelessWidget {
  final int photosCount;
  final int applicationsCount;

  const DetailStatsRow({
    super.key,
    required this.photosCount,
    required this.applicationsCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: _StatItem(
              icon: Icons.photo_outlined,
              label: '$photosCount fotos',
            ),
          ),
          Expanded(
            child: _StatItem(
              icon: Icons.people_outline,
              label: '$applicationsCount postulaciones',
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _StatItem({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 18, color: context.colors.onSurfaceVariant),
        const SizedBox(width: 6),
        Flexible(
          child: Text(
            label,
            style: context.text.bodySmall?.copyWith(
              color: context.colors.onSurface,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
