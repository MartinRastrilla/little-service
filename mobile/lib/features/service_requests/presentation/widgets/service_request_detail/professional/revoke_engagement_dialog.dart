import 'package:flutter/material.dart';

Future<bool?> showRevokeEngagementDialog(
  BuildContext context, {
  required String professionalName,
}) {
  return showDialog<bool>(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        title: const Text('¿Cancelar la contratación?'),
        content: Text(
          'Vas a dejar de trabajar con $professionalName en este pedido. '
          'El pedido volverá a la fase de postulaciones y su postulación quedará rechazada. '
          'Esta acción no se puede deshacer.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Volver'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(dialogContext).colorScheme.error,
              foregroundColor: Theme.of(dialogContext).colorScheme.onError,
            ),
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Sí, cancelar contratación'),
          ),
        ],
      );
    },
  );
}
