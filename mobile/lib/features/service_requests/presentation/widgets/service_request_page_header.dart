import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';

class ServiceRequestPageHeader extends StatelessWidget {
  const ServiceRequestPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO(iter-2): Wire search button to GET /service-requests/my?search=...
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
                  'Mis pedidos',
                  style: context.text.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.colors.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Gestioná y seguí el estado de tus pedidos',
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
              Icons.search,
              color: context.colors.onSurfaceVariant,
            ),
            style: IconButton.styleFrom(
              backgroundColor: context.colors.surface,
              side: BorderSide(
                color: context.colors.outline.withValues(alpha: 0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
