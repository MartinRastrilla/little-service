import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/constants/app_assets.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/core/utils/formatters.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_application.dart';
import 'package:mobile/features/service_requests/presentation/widgets/service_request_applications/service_request_application_badge.dart';
import 'package:mobile/features/service_requests/presentation/widgets/service_request_detail/activity/freelancer_rating_stars.dart';

class ServiceRequestApplicationCard extends StatelessWidget {
  final String serviceRequestId;
  final ServiceRequestApplication application;
  final bool canShowActions;
  final bool isActionInProgress;
  final VoidCallback? onAccept;
  final VoidCallback? onReject;

  const ServiceRequestApplicationCard({
    super.key,
    required this.serviceRequestId,
    required this.application,
    required this.canShowActions,
    this.isActionInProgress = false,
    this.onAccept,
    this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    final resolvedUrl = resolveMediaUrl(application.profilePictureUrl);

    return Material(
      color: context.colors.surface,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: context.colors.outline.withValues(alpha: 0.35),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  ServiceRequestApplicationBadge(
                    displayStatus: application.displayStatus,
                  ),
                  const Spacer(),
                  Text(
                    formatRelativeTime(application.createdAt),
                    style: context.text.labelSmall?.copyWith(
                      color: context.colors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              InkWell(
                onTap: () => context.push(
                  '/clients/freelancers/${application.freelancerId}?serviceRequestId=$serviceRequestId',
                ),
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: context.colors.primaryContainer,
                        backgroundImage: resolvedUrl.isNotEmpty
                            ? CachedNetworkImageProvider(resolvedUrl)
                            : null,
                        child: resolvedUrl.isEmpty
                            ? Image.asset(
                                AppAssets.noPicPlaceholder,
                                width: 48,
                                height: 48,
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
                            if (application.bio != null &&
                                application.bio!.trim().isNotEmpty) ...[
                              const SizedBox(height: 8),
                              Text(
                                application.bio!.trim(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: context.text.bodySmall?.copyWith(
                                  color: context.colors.onSurfaceVariant,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: context.colors.onSurfaceVariant,
                      ),
                    ],
                  ),
                ),
              ),
              if (canShowActions) ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: isActionInProgress ? null : onReject,
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size.fromHeight(48),
                        ),
                        child: const Text('Rechazar'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: FilledButton(
                        onPressed: isActionInProgress ? null : onAccept,
                        style: FilledButton.styleFrom(
                          minimumSize: const Size.fromHeight(48),
                        ),
                        child: isActionInProgress
                            ? SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: context.colors.onPrimary,
                                ),
                              )
                            : const Text('Aceptar'),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
