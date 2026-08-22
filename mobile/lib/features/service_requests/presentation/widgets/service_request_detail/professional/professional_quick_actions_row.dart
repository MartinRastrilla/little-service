import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/features/service_requests/presentation/mappers/professional_tab_error_mapper.dart';

class ProfessionalQuickActionsRow extends StatelessWidget {
  final VoidCallback? onOpenProfile;
  final VoidCallback? onOpenChat;
  final VoidCallback onComingSoon;

  const ProfessionalQuickActionsRow({
    super.key,
    required this.onOpenProfile,
    required this.onOpenChat,
    required this.onComingSoon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _QuickActionButton(
            icon: Icons.chat_bubble_outline,
            label: 'Enviar\nmensaje',
            onPressed: onOpenChat,
            isDisabled: onOpenChat == null,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _QuickActionButton(
            icon: Icons.person_outline,
            label: 'Ver\nperfil',
            onPressed: onOpenProfile,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _QuickActionButton(
            icon: Icons.phone_outlined,
            label: 'Llamar',
            // TODO(professional-tab): phone field on User + call flow
            onPressed: onComingSoon,
            isDisabled: true,
            isDestructive: true,
          ),
        ),
      ],
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;
  final bool isDisabled;
  final bool isDestructive;

  const _QuickActionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    this.isDisabled = false,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isDestructive
        ? context.colors.error
        : context.colors.primary;

    return Material(
      color: context.colors.surface,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: isDisabled ? onPressed : onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 88,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: context.colors.outline.withValues(alpha: 0.35),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isDisabled
                    ? color.withValues(alpha: 0.45)
                    : color,
              ),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: context.text.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isDisabled
                      ? context.colors.onSurfaceVariant
                      : context.colors.onSurface,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showProfessionalComingSoonSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      const SnackBar(content: Text(professionalTabComingSoonMessage)),
    );
}
