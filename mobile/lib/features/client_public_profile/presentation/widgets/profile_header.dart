import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/core/utils/formatters.dart';
import 'package:mobile/features/client_public_profile/domain/entities/client_public_profile.dart';
import 'package:mobile/features/freelancer_service_request_detail/presentation/mappers/apply_error_mapper.dart';

class ProfileHeader extends StatelessWidget {
  final ClientPublicProfile profile;

  const ProfileHeader({
    super.key,
    required this.profile,
  });

  String _ratingLabel() {
    if (profile.totalReviewsCount == 0) {
      return 'Sin calificaciones';
    }

    return '${profile.averageRating.toStringAsFixed(1)} · ${profile.totalReviewsCount} reseñas';
  }

  @override
  Widget build(BuildContext context) {
    final profileUrl = resolveMediaUrl(profile.profilePictureUrl);
    final hasPhoto = profileUrl.isNotEmpty;

    return Column(
      children: [
        CircleAvatar(
          radius: 48,
          backgroundColor: context.colors.primaryContainer,
          backgroundImage:
              hasPhoto ? CachedNetworkImageProvider(profileUrl) : null,
          child: hasPhoto
              ? null
              : Text(
                  extractInitials(profile.fullName),
                  style: context.text.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.colors.primary,
                  ),
                ),
        ),
        const SizedBox(height: 12),
        Text(
          profile.fullName,
          textAlign: TextAlign.center,
          style: context.text.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: context.colors.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: context.colors.primaryContainer.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(999),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.person_outline,
                size: 14,
                color: context.colors.primary,
              ),
              const SizedBox(width: 4),
              Text(
                'Cliente',
                style: context.text.labelSmall?.copyWith(
                  color: context.colors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star_rounded,
              size: 18,
              color: profile.totalReviewsCount > 0
                  ? const Color(0xFFF5B301)
                  : context.colors.onSurfaceVariant,
            ),
            const SizedBox(width: 4),
            Text(
              _ratingLabel(),
              style: context.text.bodyMedium?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          'Miembro desde ${formatMemberSinceMonthYear(profile.memberSince)}',
          style: context.text.bodySmall?.copyWith(
            color: context.colors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
