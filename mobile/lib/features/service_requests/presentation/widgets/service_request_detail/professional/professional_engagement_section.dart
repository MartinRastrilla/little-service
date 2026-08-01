import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/core/utils/formatters.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_professional.dart';
import 'package:mobile/features/service_requests/presentation/widgets/service_request_status_badge.dart';

class ProfessionalEngagementSection extends StatelessWidget {
  final ServiceRequestProfessional professional;

  const ProfessionalEngagementSection({
    super.key,
    required this.professional,
  });

  @override
  Widget build(BuildContext context) {
    final contract = professional.contractSummary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Información de la contratación',
          style: context.text.titleSmall?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: context.colors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: context.colors.outline.withValues(alpha: 0.25),
            ),
          ),
          child: Column(
            children: [
              _InfoRow(
                icon: Icons.calendar_today_outlined,
                label: 'Fecha de inicio estimada',
                value: contract.hasContract && contract.startDate != null
                    ? formatShortDate(contract.startDate!)
                    : 'Aún no acordada',
              ),
              const SizedBox(height: 12),
              _InfoRow(
                icon: Icons.attach_money,
                label: 'Precio acordado',
                value: contract.hasContract && contract.amount != null
                    ? formatArsPrice(contract.amount!)
                    : 'Aún no acordado',
              ),
              const SizedBox(height: 12),
              _InfoRow(
                icon: Icons.timelapse_outlined,
                label: 'Estado actual',
                valueWidget: ServiceRequestStatusBadge(
                  displayStatus: professional.displayStatus,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? value;
  final Widget? valueWidget;

  const _InfoRow({
    required this.icon,
    required this.label,
    this.value,
    this.valueWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: context.colors.primary),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: context.text.bodySmall?.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 4),
              valueWidget ??
                  Text(
                    value ?? '',
                    style: context.text.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
            ],
          ),
        ),
      ],
    );
  }
}
