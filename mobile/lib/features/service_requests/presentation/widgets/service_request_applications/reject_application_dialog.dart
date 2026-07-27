import 'package:flutter/material.dart';

Future<bool?> showRejectApplicationDialog(
  BuildContext context, {
  required String freelancerName,
}) {
  return showDialog<bool>(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        title: const Text('¿Rechazar postulación?'),
        content: Text(
          '¿Querés rechazar la postulación de $freelancerName? '
          'Podrás seguir evaluando otras postulaciones.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Rechazar'),
          ),
        ],
      );
    },
  );
}
