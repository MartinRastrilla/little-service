import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/features/freelancer_my_work/domain/entities/freelancer_work_item.dart';

class ApplicationFilterChips extends StatelessWidget {
  final FreelancerApplicationFilter selected;
  final ValueChanged<FreelancerApplicationFilter> onFilterChanged;

  const ApplicationFilterChips({
    super.key,
    required this.selected,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _FilterChip(
            label: 'Todas',
            isSelected: selected == FreelancerApplicationFilter.all,
            onSelected: () => onFilterChanged(FreelancerApplicationFilter.all),
          ),
          const SizedBox(width: 8),
          _FilterChip(
            label: 'Esperando',
            isSelected: selected == FreelancerApplicationFilter.pending,
            leading: Icon(Icons.schedule, size: 16, color: context.appColors.warning),
            onSelected: () => onFilterChanged(FreelancerApplicationFilter.pending),
          ),
          const SizedBox(width: 8),
          _FilterChip(
            label: 'Aceptadas',
            isSelected: selected == FreelancerApplicationFilter.accepted,
            leading: Icon(Icons.check_circle_outline, size: 16, color: context.appColors.success),
            onSelected: () => onFilterChanged(FreelancerApplicationFilter.accepted),
          ),
          const SizedBox(width: 8),
          _FilterChip(
            label: 'Rechazadas',
            isSelected: selected == FreelancerApplicationFilter.rejected,
            leading: Icon(Icons.cancel_outlined, size: 16, color: context.appColors.error),
            onSelected: () => onFilterChanged(FreelancerApplicationFilter.rejected),
          ),
        ],
      ),
    );
  }
}

class JobFilterChips extends StatelessWidget {
  final FreelancerJobFilter selected;
  final ValueChanged<FreelancerJobFilter> onFilterChanged;

  const JobFilterChips({
    super.key,
    required this.selected,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _FilterChip(
            label: 'Todos',
            isSelected: selected == FreelancerJobFilter.all,
            onSelected: () => onFilterChanged(FreelancerJobFilter.all),
          ),
          const SizedBox(width: 8),
          _FilterChip(
            label: 'En curso',
            isSelected: selected == FreelancerJobFilter.inProgress,
            leading: _StatusDot(color: context.appColors.warning),
            onSelected: () => onFilterChanged(FreelancerJobFilter.inProgress),
          ),
          const SizedBox(width: 8),
          _FilterChip(
            label: 'Finalizados',
            isSelected: selected == FreelancerJobFilter.completed,
            leading: Icon(Icons.check_circle_outline, size: 16, color: context.appColors.success),
            onSelected: () => onFilterChanged(FreelancerJobFilter.completed),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Widget? leading;
  final VoidCallback onSelected;

  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onSelected,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      avatar: leading,
      selected: isSelected,
      onSelected: (_) => onSelected(),
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

class _StatusDot extends StatelessWidget {
  final Color color;

  const _StatusDot({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
