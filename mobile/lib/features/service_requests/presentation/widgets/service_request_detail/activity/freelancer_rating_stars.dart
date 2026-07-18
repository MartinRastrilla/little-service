import 'package:flutter/material.dart';
import 'package:mobile/core/theme/app_colors.dart';
import 'package:mobile/core/theme/theme_context.dart';

class FreelancerRatingStars extends StatelessWidget {
  final double ratingAverage;
  final int ratingCount;

  const FreelancerRatingStars({
    super.key,
    required this.ratingAverage,
    required this.ratingCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(5, (index) {
          final starValue = index + 1;
          IconData icon;
          if (ratingAverage >= starValue) {
            icon = Icons.star_rounded;
          } else if (ratingAverage >= starValue - 0.5) {
            icon = Icons.star_half_rounded;
          } else {
            icon = Icons.star_outline_rounded;
          }

          return Icon(
            icon,
            size: 16,
            color: AppPalette.warning,
          );
        }),
        const SizedBox(width: 4),
        Text(
          '($ratingCount)',
          style: context.text.bodySmall?.copyWith(
            color: context.colors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
