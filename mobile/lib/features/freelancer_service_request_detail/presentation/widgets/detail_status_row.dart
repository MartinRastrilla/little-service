import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/core/utils/formatters.dart';
import 'package:mobile/features/service_requests/presentation/widgets/service_request_status_badge.dart';

class DetailStatusRow extends StatelessWidget {
  final String displayStatus;
  final DateTime createdAt;

  const DetailStatusRow({
    super.key,
    required this.displayStatus,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ServiceRequestStatusBadge(displayStatus: displayStatus),
        const SizedBox(width: 8),
        Text(
          'Publicado ${formatRelativeTime(createdAt).toLowerCase()}',
          style: context.text.bodySmall?.copyWith(
            color: context.colors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
