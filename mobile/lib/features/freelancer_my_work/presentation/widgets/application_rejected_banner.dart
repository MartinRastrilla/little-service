import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';

class ApplicationRejectedBanner extends StatelessWidget {
  const ApplicationRejectedBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: context.appColors.error.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.cancel_outlined,
            size: 18,
            color: context.appColors.error,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'El cliente seleccionó a otro profesional. ¡No te desanimes! Seguí postulándote.',
              style: context.text.bodySmall?.copyWith(
                color: context.appColors.error,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
