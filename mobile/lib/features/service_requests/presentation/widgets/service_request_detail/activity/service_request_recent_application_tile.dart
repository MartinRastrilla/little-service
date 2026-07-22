import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/constants/app_assets.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/core/utils/formatters.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_activity.dart';
import 'package:mobile/features/service_requests/presentation/widgets/service_request_detail/activity/freelancer_rating_stars.dart';

class ServiceRequestRecentApplicationTile extends StatelessWidget {
  final String serviceRequestId;
  final ServiceRequestRecentApplication application;

  const ServiceRequestRecentApplicationTile({
    super.key,
    required this.serviceRequestId,
    required this.application,
  });

  @override
  Widget build(BuildContext context) {
    final resolvedUrl = resolveMediaUrl(application.profilePictureUrl);

    return Material(
      color: context.colors.surface,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () => context.push(
          '/clients/freelancers/${application.freelancerId}?serviceRequestId=$serviceRequestId',
        ),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: context.colors.primaryContainer,
                backgroundImage: resolvedUrl.isNotEmpty
                    ? CachedNetworkImageProvider(resolvedUrl)
                    : null,
                child: resolvedUrl.isEmpty
                    ? Image.asset(
                        AppAssets.noPicPlaceholder,
                        width: 44,
                        height: 44,
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      application.freelancerName,
                      style: context.text.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: context.colors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    FreelancerRatingStars(
                      ratingAverage: application.ratingAverage,
                      ratingCount: application.ratingCount,
                    ),
                  ],
                ),
              ),
              Text(
                formatRelativeTime(application.createdAt),
                style: context.text.bodySmall?.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.chevron_right,
                color: context.colors.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
