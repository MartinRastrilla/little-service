import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';

class ProfessionalEmptyState extends StatelessWidget {
  const ProfessionalEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person_search_outlined,
              size: 56,
              color: context.colors.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            Text(
              'Todavía no elegiste un profesional',
              style: context.text.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Cuando aceptes una postulación, vas a ver acá la información del profesional asignado.',
              style: context.text.bodyMedium?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
