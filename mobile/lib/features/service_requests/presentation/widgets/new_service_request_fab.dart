import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';

class NewServiceRequestFab extends StatelessWidget {
  final VoidCallback? onPressed;

  const NewServiceRequestFab({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: context.colors.surface,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              'Nuevo pedido',
              style: context.text.labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: context.colors.onSurface,
              ),
            ),
          ),
          const SizedBox(width: 8),
          FloatingActionButton(
            onPressed: onPressed,
            backgroundColor: context.colors.primary,
            foregroundColor: context.colors.onPrimary,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
