import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/features/freelancer_home/presentation/mappers/open_service_request_badge_resolver.dart';

class OpenServiceRequestBadge extends StatelessWidget {
  final OpenServiceRequestBadgeData data;

  const OpenServiceRequestBadge({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final style = resolveOpenServiceRequestBadgeStyle(data.type);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: style.backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        data.label,
        style: context.text.labelSmall?.copyWith(
          color: style.textColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
