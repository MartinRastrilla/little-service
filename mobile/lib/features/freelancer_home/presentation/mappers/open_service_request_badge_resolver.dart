import 'package:flutter/material.dart';
import 'package:mobile/features/freelancer_home/domain/entities/open_service_request_summary.dart';

enum OpenServiceRequestBadgeType {
  nuevo,
  publicadoHoy,
  popular,
}

class OpenServiceRequestBadgeData {
  final OpenServiceRequestBadgeType type;
  final String label;

  const OpenServiceRequestBadgeData({
    required this.type,
    required this.label,
  });
}

OpenServiceRequestBadgeData? resolveOpenServiceRequestBadge(
  OpenServiceRequestSummary request,
) {
  final now = DateTime.now();
  final createdAt = request.createdAt.toLocal();
  final age = now.difference(createdAt);

  if (age.inHours <= 2) {
    return const OpenServiceRequestBadgeData(
      type: OpenServiceRequestBadgeType.nuevo,
      label: 'Nuevo',
    );
  }

  final isSameDay = now.year == createdAt.year &&
      now.month == createdAt.month &&
      now.day == createdAt.day;

  if (isSameDay) {
    return const OpenServiceRequestBadgeData(
      type: OpenServiceRequestBadgeType.publicadoHoy,
      label: 'Publicado hoy',
    );
  }

  if (request.applicationsCount >= 5) {
    return const OpenServiceRequestBadgeData(
      type: OpenServiceRequestBadgeType.popular,
      label: 'Popular',
    );
  }

  return null;
}

OpenServiceRequestBadgeStyle resolveOpenServiceRequestBadgeStyle(
  OpenServiceRequestBadgeType type,
) {
  return switch (type) {
    OpenServiceRequestBadgeType.nuevo => const OpenServiceRequestBadgeStyle(
        backgroundColor: Color(0xFFE8F8F0),
        textColor: Color(0xFF1B8A5A),
      ),
    OpenServiceRequestBadgeType.publicadoHoy =>
      const OpenServiceRequestBadgeStyle(
        backgroundColor: Color(0xFFE9EEFA),
        textColor: Color(0xFF3B5CCC),
      ),
    OpenServiceRequestBadgeType.popular => const OpenServiceRequestBadgeStyle(
        backgroundColor: Color(0xFFF3E8FF),
        textColor: Color(0xFF7C3AED),
      ),
  };
}

class OpenServiceRequestBadgeStyle {
  final Color backgroundColor;
  final Color textColor;

  const OpenServiceRequestBadgeStyle({
    required this.backgroundColor,
    required this.textColor,
  });
}
