import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/features/freelancer_my_work/domain/entities/freelancer_work_item.dart';

class MyWorkHeader extends StatelessWidget {
  final FreelancerMyWorkTab tab;

  const MyWorkHeader({super.key, required this.tab});

  @override
  Widget build(BuildContext context) {
    final subtitle = tab == FreelancerMyWorkTab.applications
        ? 'Gestioná tus postulaciones y trabajos.'
        : 'Gestioná tus trabajos y seguí su progreso.';

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Mis trabajos',
                  style: context.text.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.search,
                  color: context.colors.onSurfaceVariant.withValues(alpha: 0.4),
                ),
              ),
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.notifications_none,
                  color: context.colors.onSurfaceVariant.withValues(alpha: 0.4),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: context.text.bodyMedium?.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
