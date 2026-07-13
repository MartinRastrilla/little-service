import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';

class RegisterSecurityBanner extends StatelessWidget {
  const RegisterSecurityBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.primaryContainer.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.shield_outlined, color: context.colors.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tu información está segura',
                  style: context.text.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.colors.primary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Utilizamos cifrado para proteger tus datos personales.',
                  style: context.text.bodySmall?.copyWith(
                    color: context.colors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
