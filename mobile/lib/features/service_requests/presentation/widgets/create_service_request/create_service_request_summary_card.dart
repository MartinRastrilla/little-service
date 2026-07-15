import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/core/utils/formatters.dart';
import 'package:mobile/features/service_requests/domain/entities/create_service_request_draft.dart';

class CreateServiceRequestSummaryCard extends StatelessWidget {
  final CreateServiceRequestDraft draft;
  final int photoCount;

  const CreateServiceRequestSummaryCard({
    super.key,
    required this.draft,
    required this.photoCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.colors.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Resumen de tu pedido',
            style: context.text.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: context.colors.onSurface,
            ),
          ),
          const SizedBox(height: 16),
          _SummaryRow(
            icon: Icons.description_outlined,
            label: 'Título',
            value: draft.title,
          ),
          const SizedBox(height: 12),
          _SummaryRow(
            icon: Icons.notes_outlined,
            label: 'Descripción',
            value: draft.description,
          ),
          const SizedBox(height: 12),
          _SummaryRow(
            icon: Icons.location_on_outlined,
            label: 'Ubicación',
            value: draft.location,
          ),
          const SizedBox(height: 12),
          _SummaryRow(
            icon: Icons.payments_outlined,
            label: 'Presupuesto',
            value: draft.price != null
                ? '${formatArsPrice(draft.price!)} (estimado)'
                : 'A acordar con el profesional',
          ),
          const SizedBox(height: 12),
          _SummaryRow(
            icon: Icons.photo_library_outlined,
            label: 'Fotos',
            value: photoCount == 0
                ? 'Sin fotos'
                : photoCount == 1
                ? '1 foto'
                : '$photoCount fotos',
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: context.colors.secondary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.shield_outlined,
                  size: 20,
                  color: context.colors.secondary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Al crear el pedido, será visible para los profesionales que puedan ayudarte.',
                    style: context.text.bodySmall?.copyWith(
                      color: context.colors.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _SummaryRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 20,
          color: context.colors.primary,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: context.text.labelMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: context.colors.onSurface,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: context.text.bodySmall?.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
