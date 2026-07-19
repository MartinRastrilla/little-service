import 'package:flutter/material.dart';

class ApplicationBadgeStyle {
  final String label;
  final Color backgroundColor;
  final Color textColor;

  const ApplicationBadgeStyle({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
  });
}

ApplicationBadgeStyle resolveApplicationBadgeStyle(String displayStatus) {
  return switch (displayStatus) {
    'Esperando respuesta' => ApplicationBadgeStyle(
        label: displayStatus,
        backgroundColor: const Color(0xFFFFF3CD),
        textColor: const Color(0xFF856404),
      ),
    'Aceptada' => ApplicationBadgeStyle(
        label: displayStatus,
        backgroundColor: const Color(0xFFD4EDDA),
        textColor: const Color(0xFF155724),
      ),
    'No seleccionada' => ApplicationBadgeStyle(
        label: displayStatus,
        backgroundColor: const Color(0xFFF8D7DA),
        textColor: const Color(0xFF721C24),
      ),
    _ => ApplicationBadgeStyle(
        label: displayStatus,
        backgroundColor: const Color(0xFFE9ECEF),
        textColor: const Color(0xFF495057),
      ),
  };
}

class JobBadgeStyle {
  final String label;
  final Color backgroundColor;
  final Color textColor;

  const JobBadgeStyle({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
  });
}

JobBadgeStyle resolveJobBadgeStyle(String displayStatus) {
  return switch (displayStatus) {
    'En curso' => JobBadgeStyle(
        label: displayStatus,
        backgroundColor: const Color(0xFFD1ECF1),
        textColor: const Color(0xFF0C5460),
      ),
    'Finalizado' => JobBadgeStyle(
        label: displayStatus,
        backgroundColor: const Color(0xFFD4EDDA),
        textColor: const Color(0xFF155724),
      ),
    'Cancelado' => JobBadgeStyle(
        label: displayStatus,
        backgroundColor: const Color(0xFFF8D7DA),
        textColor: const Color(0xFF721C24),
      ),
    _ => JobBadgeStyle(
        label: displayStatus,
        backgroundColor: const Color(0xFFE9ECEF),
        textColor: const Color(0xFF495057),
      ),
  };
}

String resolveApplicationCtaLabel({
  required String? applicationStatus,
  required bool canViewApplicationDetail,
}) {
  if (canViewApplicationDetail) return 'Ver postulación';

  return switch (applicationStatus?.toLowerCase()) {
    'accepted' => 'Contratado',
    'rejected' => 'Ver detalles',
    _ => 'Ver postulación',
  };
}

bool isApplicationCtaEnabled(bool canViewApplicationDetail) =>
    canViewApplicationDetail;

String resolveJobPriceLabel({
  required double? contractAmount,
  required bool hasContract,
}) {
  if (hasContract && contractAmount != null) {
    return 'Precio acordado';
  }
  return 'Precio acordado';
}

String resolveContractStartLabel({
  required bool hasContract,
  required DateTime? contractStartDate,
  required String Function(DateTime) formatDate,
}) {
  if (!hasContract || contractStartDate == null) {
    return 'Trabajo aún sin contrato';
  }
  return 'Iniciado el ${formatDate(contractStartDate)}';
}
