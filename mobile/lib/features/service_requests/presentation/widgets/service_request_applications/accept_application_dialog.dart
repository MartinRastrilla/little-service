import 'package:flutter/material.dart';

Future<bool?> showAcceptApplicationDialog(
  BuildContext context, {
  required String freelancerName,
}) {
  return showDialog<bool>(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        title: Text('¿Elegir a $freelancerName?'),
        content: Text(
          'Al aceptar, $freelancerName quedará asignado a tu pedido '
          'y este dejará de recibir nuevas postulaciones.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Sí, elegir'),
          ),
        ],
      );
    },
  );
}
