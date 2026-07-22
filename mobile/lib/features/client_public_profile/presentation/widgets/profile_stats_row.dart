import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/features/client_public_profile/domain/entities/client_public_profile.dart';

class ProfileStatsRow extends StatelessWidget {
  final ClientPublicProfile profile;

  const ProfileStatsRow({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    final ratingValue = profile.totalReviewsCount > 0
        ? profile.averageRating.toStringAsFixed(1)
        : '-';

    return Row(
      children: [
        Expanded(
          child: _StatCard(
            icon: Icons.star_outline_rounded,
            value: ratingValue,
            label: profile.totalReviewsCount > 0
                ? '${profile.totalReviewsCount} calificaciones'
                : 'Sin calificaciones',
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _StatCard(
            icon: Icons.work_outline,
            value: '${profile.publishedJobsCount}',
            label: 'trabajos publicados',
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: context.colors.outline.withValues(alpha: 0.35),
        ),
      ),
      child: Column(
        children: [
          Icon(icon, size: 20, color: context.colors.primary),
          const SizedBox(height: 8),
          Text(
            value,
            style: context.text.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: context.colors.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: context.text.bodySmall?.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
