import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_professional.dart';

class ProfessionalActionsList extends StatelessWidget {
  final ServiceRequestProfessional professional;
  final String professionalName;
  final VoidCallback? onOpenChat;
  final VoidCallback? onRevokeEngagement;
  final VoidCallback onComingSoon;

  const ProfessionalActionsList({
    super.key,
    required this.professional,
    required this.professionalName,
    required this.onOpenChat,
    required this.onRevokeEngagement,
    required this.onComingSoon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Acciones',
          style: context.text.titleSmall?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12),
        _ActionTile(
          icon: Icons.chat_bubble_outline,
          title: 'Ir al chat con $professionalName',
          subtitle: 'Conversación privada sobre este pedido',
          onTap: onOpenChat,
          isDisabled: onOpenChat == null,
        ),
        _ActionTile(
          icon: Icons.description_outlined,
          title: 'Ver contrato',
          subtitle: 'Revisá los términos acordados',
          // TODO(professional-tab): contract viewer screen/PDF
          onTap: onComingSoon,
          isDisabled: true,
        ),
        _ActionTile(
          icon: Icons.cancel_outlined,
          title: 'Cancelar contratación',
          subtitle: professional.actions.canRevokeEngagement
              ? 'Esta acción no se puede deshacer'
              : professional.actions.revokeEngagementBlockedReason ??
                  'No podés cancelar la contratación en este momento',
          onTap: professional.actions.canRevokeEngagement
              ? onRevokeEngagement
              : () {
                  final reason =
                      professional.actions.revokeEngagementBlockedReason;
                  if (reason != null) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(content: Text(reason)));
                  }
                },
          isDestructive: true,
          isDisabled: !professional.actions.canRevokeEngagement,
        ),
      ],
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final bool isDestructive;
  final bool isDisabled;

  const _ActionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.isDestructive = false,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isDestructive ? context.colors.error : context.colors.primary;

    return Material(
      color: context.colors.surface,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: context.colors.outline.withValues(alpha: 0.25),
            ),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: isDisabled ? color.withValues(alpha: 0.45) : color,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.text.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: isDisabled && isDestructive
                            ? context.colors.onSurfaceVariant
                            : (isDestructive ? color : null),
                      ),
                    ),
                    const SizedBox(height: 2),
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
