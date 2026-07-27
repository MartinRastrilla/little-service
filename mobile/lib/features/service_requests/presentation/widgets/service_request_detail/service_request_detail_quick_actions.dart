import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';

class ServiceRequestDetailQuickActions extends StatelessWidget {
  final int messagesCount;
  final int applicationsCount;
  final VoidCallback? onApplicationsPressed;

  const ServiceRequestDetailQuickActions({
    super.key,
    required this.messagesCount,
    required this.applicationsCount,
    this.onApplicationsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerHighest.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Acciones rápidas',
            style: context.text.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: context.colors.onSurface,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _QuickActionButton(
                  icon: Icons.edit_outlined,
                  label: 'Editar\npedido',
                  // TODO(iter-2): navigate to edit service request flow.
                  onPressed: null,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _QuickActionButton(
                  icon: Icons.chat_bubble_outline,
                  label: 'Ver\nmensajes',
                  badgeCount: messagesCount,
                  // TODO(iter-2): navigate to messages for this service request.
                  onPressed: null,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _QuickActionButton(
                  icon: Icons.groups_outlined,
                  label: 'Ver\npostulaciones',
                  badgeCount: applicationsCount,
                  onPressed: onApplicationsPressed,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final int? badgeCount;
  final VoidCallback? onPressed;

  const _QuickActionButton({
    required this.icon,
    required this.label,
    this.badgeCount,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Material(
          color: context.colors.surface,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: 96,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: context.colors.outline.withValues(alpha: 0.35),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: context.colors.primary, size: 24),
                  const SizedBox(height: 8),
                  Text(
                    label,
                    textAlign: TextAlign.center,
                    style: context.text.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: context.colors.onSurface,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (badgeCount != null && badgeCount! > 0)
          Positioned(
            top: -4,
            right: -4,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: context.colors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '$badgeCount',
                style: context.text.labelSmall?.copyWith(
                  color: context.colors.onPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
