import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/features/freelancer_home/domain/entities/open_service_request_date_filter.dart';

class FreelancerHomeDateFilterChips extends StatelessWidget {
  final OpenServiceRequestDateFilter selected;
  final ValueChanged<OpenServiceRequestDateFilter>? onFilterChanged;

  const FreelancerHomeDateFilterChips({
    super.key,
    required this.selected,
    this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          _DateFilterChip(
            label: 'Todos',
            isSelected: selected == OpenServiceRequestDateFilter.all,
            onSelected: onFilterChanged == null
                ? null
                : () => onFilterChanged!(OpenServiceRequestDateFilter.all),
          ),
          const SizedBox(width: 8),
          _DateFilterChip(
            label: 'Hoy',
            isSelected: selected == OpenServiceRequestDateFilter.today,
            onSelected: onFilterChanged == null
                ? null
                : () => onFilterChanged!(OpenServiceRequestDateFilter.today),
          ),
          const SizedBox(width: 8),
          _DateFilterChip(
            label: '1 Semana',
            isSelected: selected == OpenServiceRequestDateFilter.week,
            onSelected: onFilterChanged == null
                ? null
                : () => onFilterChanged!(OpenServiceRequestDateFilter.week),
          ),
        ],
      ),
    );
  }
}

class _DateFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onSelected;

  const _DateFilterChip({
    required this.label,
    required this.isSelected,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: onSelected == null ? null : (_) => onSelected!(),
      showCheckmark: false,
      labelStyle: TextStyle(
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
        color: isSelected ? context.colors.onPrimary : context.colors.onSurface,
      ),
      selectedColor: context.colors.primary,
      backgroundColor: context.colors.surface,
      side: BorderSide(
        color: isSelected
            ? context.colors.primary
            : context.colors.outline.withValues(alpha: 0.5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4),
    );
  }
}
