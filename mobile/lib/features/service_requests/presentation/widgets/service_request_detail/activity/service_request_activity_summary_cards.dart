import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';

class ServiceRequestActivitySummaryCards extends StatelessWidget {
  final int messagesCount;
  final int applicationsCount;

  const ServiceRequestActivitySummaryCards({
    super.key,
    required this.messagesCount,
    required this.applicationsCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _SummaryCard(
            icon: Icons.chat_bubble_outline,
            iconColor: context.colors.primary,
            count: messagesCount,
            title: 'Mensajes',
            subtitle: 'Conversaciones activas',
            // TODO(iter-3): navigate to messages for this service request.
            onTap: null,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _SummaryCard(
            icon: Icons.groups_outlined,
            iconColor: context.appColors.success,
            count: applicationsCount,
            title: 'Postulaciones',
            subtitle: 'Profesionales interesados',
            // TODO(iter-3): navigate to applications list for this service request.
            onTap: null,
          ),
        ),
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final int count;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const _SummaryCard({
    required this.icon,
    required this.iconColor,
    required this.count,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.surface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: context.colors.outline.withValues(alpha: 0.35),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$count',
                      style: context.text.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: context.colors.onSurface,
                      ),
                    ),
                    Text(
                      title,
                      style: context.text.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: context.colors.onSurface,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: context.text.bodySmall?.copyWith(
                        color: context.colors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: context.colors.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
