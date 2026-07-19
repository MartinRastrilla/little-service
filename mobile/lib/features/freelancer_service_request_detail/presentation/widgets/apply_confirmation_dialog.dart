import 'package:flutter/material.dart';

Future<bool?> showApplyConfirmationDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        title: const Text('Confirmar postulación'),
        content: const Text(
          '¿Querés postularte a este trabajo? El cliente podrá ver tu perfil.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('No, cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Sí, postularme'),
          ),
        ],
      );
    },
  );
}
