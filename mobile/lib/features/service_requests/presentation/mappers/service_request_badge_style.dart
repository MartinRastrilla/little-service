import 'package:flutter/material.dart';
import 'package:mobile/core/theme/app_colors.dart';

class ServiceRequestBadgeStyle {
  final String label;
  final Color backgroundColor;
  final Color textColor;

  const ServiceRequestBadgeStyle({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
  });
}

ServiceRequestBadgeStyle resolveServiceRequestBadgeStyle(String displayStatus) {
  switch (displayStatus) {
    case 'Opened':
      return const ServiceRequestBadgeStyle(
        label: 'Abierto',
        backgroundColor: Color(0xFFE8F8F0),
        textColor: AppPalette.success,
      );
    case 'InProgress':
      return const ServiceRequestBadgeStyle(
        label: 'En progreso',
        backgroundColor: Color(0xFFFFF4E5),
        textColor: AppPalette.warning,
      );
    case 'Draft':
      return const ServiceRequestBadgeStyle(
        label: 'Borrador',
        backgroundColor: Color(0xFFFFF4E5),
        textColor: AppPalette.warning,
      );
    case 'SignedByClient':
    case 'SignedByFreelancer':
      return const ServiceRequestBadgeStyle(
        label: 'Pendiente de firma',
        backgroundColor: Color(0xFFFFF4E5),
        textColor: AppPalette.warning,
      );
    case 'Signed':
      return const ServiceRequestBadgeStyle(
        label: 'En curso',
        backgroundColor: Color(0xFFFFF4E5),
        textColor: AppPalette.warning,
      );
    case 'Closed':
    case 'Completed':
      return const ServiceRequestBadgeStyle(
        label: 'Finalizado',
        backgroundColor: Color(0xFFE9EEFA),
        textColor: AppPalette.primary,
      );
    case 'Cancelled':
      return const ServiceRequestBadgeStyle(
        label: 'Cancelado',
        backgroundColor: Color(0xFFFEECEB),
        textColor: AppPalette.error,
      );
    default:
      return const ServiceRequestBadgeStyle(
        label: 'Desconocido',
        backgroundColor: Color(0xFFF0F3F8),
        textColor: AppPalette.textSecondary,
      );
  }
}
