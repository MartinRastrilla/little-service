import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';

enum ServiceRequestFilterOption {
  all,
  open,
  inProgress,
  completed,
  cancelled,
}

class ServiceRequestFilterChips extends StatelessWidget {
  final ServiceRequestFilterOption selected;

  const ServiceRequestFilterChips({
    super.key,
    this.selected = ServiceRequestFilterOption.all,
  });

  @override
  Widget build(BuildContext context) {
    // TODO(iter-2): Wire filter chips to GET /service-requests/my?status=...
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _FilterChip(
            label: 'Todos',
            isSelected: selected == ServiceRequestFilterOption.all,
            onSelected: null,
          ),
          const SizedBox(width: 8),
          _FilterChip(
            label: 'Abiertos',
            isSelected: selected == ServiceRequestFilterOption.open,
            leading: _StatusDot(color: context.appColors.success),
            onSelected: null,
          ),
          const SizedBox(width: 8),
          _FilterChip(
            label: 'En progreso',
            isSelected: selected == ServiceRequestFilterOption.inProgress,
            leading: _StatusDot(color: context.appColors.warning),
            onSelected: null,
          ),
          const SizedBox(width: 8),
          _FilterChip(
            label: 'Finalizados',
            isSelected: selected == ServiceRequestFilterOption.completed,
            leading: Icon(
              Icons.check_circle_outline,
              size: 16,
              color: context.colors.primary,
            ),
            onSelected: null,
          ),
          const SizedBox(width: 8),
          _FilterChip(
            label: 'Cancelados',
            isSelected: selected == ServiceRequestFilterOption.cancelled,
            leading: Icon(
              Icons.cancel_outlined,
              size: 16,
              color: context.appColors.error,
            ),
            onSelected: null,
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
  final VoidCallback? onSelected;

  const _FilterChip({
    required this.label,
    required this.isSelected,
    this.leading,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      avatar: leading,
      selected: isSelected,
      onSelected: onSelected == null ? null : (_) => onSelected!(),
      showCheckmark: false,
      labelStyle: TextStyle(
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
        color: isSelected
            ? context.colors.onPrimary
            : context.colors.onSurface,
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
