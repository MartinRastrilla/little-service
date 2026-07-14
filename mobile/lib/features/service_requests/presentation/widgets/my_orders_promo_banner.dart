import 'package:flutter/material.dart';
import 'package:mobile/core/constants/app_assets.dart';
import 'package:mobile/core/theme/theme_context.dart';

class MyOrdersPromoBanner extends StatelessWidget {
  const MyOrdersPromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 80),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            Icons.assignment_outlined,
            color: context.colors.primary,
            size: 28,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              '¿Necesitás un nuevo servicio? Creá un nuevo pedido y encontrá al profesional ideal para tu tarea.',
              style: context.text.bodySmall?.copyWith(
                color: context.colors.onSurface,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Image.asset(
            AppAssets.landscapeWithoutBackground,
            width: 48,
            height: 48,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
