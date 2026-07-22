import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/core/utils/formatters.dart';
import 'package:mobile/features/freelancer_public_profile/domain/entities/freelancer_public_profile.dart';
import 'package:mobile/features/freelancer_service_request_detail/presentation/mappers/apply_error_mapper.dart';

class ProfileReviewsSection extends StatelessWidget {
  final FreelancerPublicProfile profile;

  const ProfileReviewsSection({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Calificaciones de clientes',
          style: context.text.titleSmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: context.colors.onSurface,
          ),
        ),
        // TODO(future): paginated reviews screen
        const SizedBox(height: 12),
        if (profile.recentReviews.isEmpty)
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
            child: Text(
              'Este profesional aún no tiene reseñas de clientes.',
              textAlign: TextAlign.center,
              style: context.text.bodyMedium?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
          )
        else
          ...profile.recentReviews.map(
            (review) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _ReviewCard(review: review),
            ),
          ),
      ],
    );
  }
}

class _ReviewCard extends StatelessWidget {
  final FreelancerReviewPreview review;

  const _ReviewCard({
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    final profileUrl = resolveMediaUrl(review.reviewerProfilePictureUrl);
    final hasPhoto = profileUrl.isNotEmpty;

    return Container(
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
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: context.colors.primaryContainer,
                backgroundImage:
                    hasPhoto ? CachedNetworkImageProvider(profileUrl) : null,
                child: hasPhoto
                    ? null
                    : Text(
                        extractInitials(review.reviewerName),
                        style: context.text.labelSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: context.colors.primary,
                        ),
                      ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          index < review.rating
                              ? Icons.star_rounded
                              : Icons.star_outline_rounded,
                          size: 16,
                          color: const Color(0xFFF5B301),
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      formatRelativeTime(review.createdAt),
                      style: context.text.bodySmall?.copyWith(
                        color: context.colors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (review.comment != null && review.comment!.trim().isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              '"${review.comment!.trim()}"',
              style: context.text.bodyMedium?.copyWith(
                color: context.colors.onSurface,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
          const SizedBox(height: 12),
          Text(
            review.reviewerName,
            style: context.text.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: context.colors.onSurface,
            ),
          ),
          Text(
            review.serviceRequestTitle,
            style: context.text.bodySmall?.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
