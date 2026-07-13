import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';

const _loremIpsum = '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.
''';

Future<void> showTermsAndConditionsDialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        title: Text(
          'Términos y condiciones',
          style: dialogContext.text.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Text(
              _loremIpsum,
              style: dialogContext.text.bodyMedium?.copyWith(
                color: dialogContext.colors.onSurfaceVariant,
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cerrar'),
          ),
        ],
      );
    },
  );
}
