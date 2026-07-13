import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';

class RegisterRoleInfoBanner extends StatelessWidget {
  const RegisterRoleInfoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.shield_outlined, color: context.colors.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Tú decides. Puedes elegir ambas opciones si quieres contratar y ofrecer servicios.',
              style: context.text.bodySmall?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
