import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';

class RegisterRoleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String highlight;
  final bool isSelected;
  final VoidCallback onTap;

  const RegisterRoleCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.highlight,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected
                  ? context.colors.primary
                  : context.colors.outlineVariant,
              width: isSelected ? 2 : 1,
            ),
            color: context.colors.surface,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: context.colors.primaryContainer.withValues(alpha: 0.5),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: context.colors.primary),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.text.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: context.colors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: context.text.bodySmall?.copyWith(
                        color: context.colors.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: context.colors.primaryContainer.withValues(
                          alpha: 0.35,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            size: 16,
                            color: context.colors.primary,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              highlight,
                              style: context.text.bodySmall?.copyWith(
                                color: context.colors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                isSelected
                    ? Icons.check_circle
                    : Icons.radio_button_unchecked,
                color: isSelected
                    ? context.colors.primary
                    : context.colors.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
