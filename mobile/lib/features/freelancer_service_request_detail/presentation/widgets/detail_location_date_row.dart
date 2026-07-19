import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/core/utils/formatters.dart';

class DetailLocationDateRow extends StatelessWidget {
  final String location;
  final DateTime createdAt;

  const DetailLocationDateRow({
    super.key,
    required this.location,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _InfoRow(
          icon: Icons.location_on_outlined,
          label: location.trim(),
        ),
        const SizedBox(height: 8),
        _InfoRow(
          icon: Icons.calendar_today_outlined,
          label: 'Publicado ${formatRelativeTime(createdAt).toLowerCase()}',
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoRow({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: context.colors.onSurfaceVariant),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            label,
            style: context.text.bodyMedium?.copyWith(
              color: context.colors.onSurface,
            ),
          ),
        ),
      ],
    );
  }
}
