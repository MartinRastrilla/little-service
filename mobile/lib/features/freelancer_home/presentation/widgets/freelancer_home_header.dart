import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';

class FreelancerHomeHeader extends StatelessWidget {
  final String firstName;

  const FreelancerHomeHeader({
    super.key,
    required this.firstName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hola $firstName 👋',
                  style: context.text.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.colors.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Encontrá nuevos trabajos y hacé crecer tu negocio.',
                  style: context.text.bodyMedium?.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.notifications_outlined,
              color: context.colors.onSurfaceVariant.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );
  }
}
