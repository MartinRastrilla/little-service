import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_application.dart';

class ServiceRequestApplicationFilterChips extends StatelessWidget {
  final ServiceRequestApplicationFilter selected;
  final ValueChanged<ServiceRequestApplicationFilter> onFilterChanged;

  const ServiceRequestApplicationFilterChips({
    super.key,
    required this.selected,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _FilterChip(
          label: 'Pendientes',
          isSelected: selected == ServiceRequestApplicationFilter.pending,
          onSelected: () =>
              onFilterChanged(ServiceRequestApplicationFilter.pending),
        ),
        const SizedBox(width: 8),
        _FilterChip(
          label: 'Todas',
          isSelected: selected == ServiceRequestApplicationFilter.all,
          onSelected: () => onFilterChanged(ServiceRequestApplicationFilter.all),
        ),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onSelected;

  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onSelected(),
      showCheckmark: false,
      selectedColor: context.colors.primaryContainer,
      labelStyle: context.text.labelLarge?.copyWith(
        color: isSelected
            ? context.colors.onPrimaryContainer
            : context.colors.onSurfaceVariant,
        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
      ),
      side: BorderSide(
        color: isSelected
            ? context.colors.primary
            : context.colors.outline.withValues(alpha: 0.35),
      ),
    );
  }
}
