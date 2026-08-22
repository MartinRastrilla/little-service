import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/theme/app_colors.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/core/utils/formatters.dart';
import 'package:mobile/features/freelancer_public_profile/domain/entities/freelancer_public_profile.dart';
import 'package:mobile/features/freelancer_service_request_detail/presentation/mappers/apply_error_mapper.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_professional.dart';

class ProfessionalProfileSummaryCard extends StatelessWidget {
  final FreelancerPublicProfile profile;
  final ServiceRequestProfessional professional;

  const ProfessionalProfileSummaryCard({
    super.key,
    required this.profile,
    required this.professional,
  });

  @override
  Widget build(BuildContext context) {
    final profileUrl = resolveMediaUrl(profile.profilePictureUrl);
    final hasPhoto = profileUrl.isNotEmpty;
    final ratingLabel = profile.totalReviewsCount == 0
        ? 'Sin calificaciones'
        : profile.averageRating.toStringAsFixed(1);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: context.colors.outline.withValues(alpha: 0.25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 32,
                backgroundColor: context.colors.primaryContainer,
                backgroundImage:
                    hasPhoto ? CachedNetworkImageProvider(profileUrl) : null,
                child: hasPhoto
                    ? null
                    : Text(
                        extractInitials(profile.fullName),
                        style: context.text.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: context.colors.primary,
                        ),
                      ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            profile.fullName,
                            style: context.text.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        if (profile.isVerified)
                          Icon(
                            Icons.verified,
                            size: 18,
                            color: context.colors.primary,
                          ),
                      ],
                    ),
                    if (profile.profession?.trim().isNotEmpty == true) ...[
                      const SizedBox(height: 2),
                      Text(
                        profile.profession!.trim(),
                        style: context.text.bodySmall?.copyWith(
                          color: context.colors.onSurfaceVariant,
                        ),
                      ),
                    ],
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 12,
                      runSpacing: 2,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star_rounded,
                              size: 16,
                              color: profile.totalReviewsCount > 0
                                  ? const Color(0xFFF5B301)
                                  : context.colors.onSurfaceVariant,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              ratingLabel,
                              style: context.text.bodySmall?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '${profile.completedJobs} trabajos completados',
                          style: context.text.bodySmall?.copyWith(
                            color: context.colors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 16,
                          color: context.colors.primary,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            professional.serviceLocation.trim(),
                            style: context.text.bodySmall?.copyWith(
                              color: context.colors.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F8F0),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                'Profesional seleccionado',
                style: context.text.labelSmall?.copyWith(
                  color: AppPalette.success,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
