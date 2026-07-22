import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/features/freelancer_public_profile/domain/entities/freelancer_public_profile.dart';

class ProfileAboutSection extends StatefulWidget {
  final FreelancerPublicProfile profile;

  const ProfileAboutSection({
    super.key,
    required this.profile,
  });

  @override
  State<ProfileAboutSection> createState() => _ProfileAboutSectionState();
}

class _ProfileAboutSectionState extends State<ProfileAboutSection> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final bio = widget.profile.bio?.trim();
    final hasBio = bio != null && bio.isNotEmpty;
    final displayText = hasBio
        ? bio
        : 'Este profesional aún no agregó una descripción.';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sobre mí',
          style: context.text.titleSmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: context.colors.onSurface,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: context.colors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: context.colors.outline.withValues(alpha: 0.35),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                displayText,
                maxLines: _expanded ? null : 3,
                overflow: _expanded ? null : TextOverflow.ellipsis,
                style: context.text.bodyMedium?.copyWith(
                  color: hasBio
                      ? context.colors.onSurface
                      : context.colors.onSurfaceVariant,
                  fontStyle: hasBio ? FontStyle.normal : FontStyle.italic,
                ),
              ),
              if (hasBio && bio.length > 120) ...[
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () => setState(() => _expanded = !_expanded),
                  child: Text(
                    _expanded ? 'Leer menos' : 'Leer más',
                    style: context.text.labelLarge?.copyWith(
                      color: context.colors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
