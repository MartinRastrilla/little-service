import 'package:flutter/material.dart';
import 'package:mobile/features/service_requests/presentation/mappers/service_request_badge_style.dart';

class ServiceRequestStatusBadge extends StatelessWidget {
  final String displayStatus;

  const ServiceRequestStatusBadge({
    super.key,
    required this.displayStatus,
  });

  @override
  Widget build(BuildContext context) {
    final style = resolveServiceRequestBadgeStyle(displayStatus);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: style.backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        style.label,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: style.textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
