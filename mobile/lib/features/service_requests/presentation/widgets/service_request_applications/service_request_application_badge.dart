import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/features/freelancer_my_work/presentation/mappers/freelancer_my_work_mappers.dart';

class ServiceRequestApplicationBadge extends StatelessWidget {
  final String displayStatus;

  const ServiceRequestApplicationBadge({
    super.key,
    required this.displayStatus,
  });

  @override
  Widget build(BuildContext context) {
    final badge = resolveApplicationBadgeStyle(displayStatus);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: badge.backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        badge.label,
        style: context.text.labelSmall?.copyWith(
          color: badge.textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
