import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/core/utils/formatters.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_summary.dart';
import 'package:mobile/features/service_requests/presentation/widgets/service_request_photo_thumbnail.dart';
import 'package:mobile/features/service_requests/presentation/widgets/service_request_price_block.dart';
import 'package:mobile/features/service_requests/presentation/widgets/service_request_status_badge.dart';

class ServiceRequestCard extends StatelessWidget {
  final ServiceRequestSummary request;

  const ServiceRequestCard({
    super.key,
    required this.request,
  });

  @override
  Widget build(BuildContext context) {
    // TODO(iter-2): navigate to service request detail on tap.
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      color: context.colors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: context.colors.outline.withValues(alpha: 0.4)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ServiceRequestStatusBadge(displayStatus: request.displayStatus),
                const Spacer(),
                Text(
                  formatRelativeTime(request.createdAt),
                  style: context.text.bodySmall?.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        request.title,
                        style: context.text.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: context.colors.onSurface,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 16,
                            color: context.colors.onSurfaceVariant,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              request.location.trim(),
                              style: context.text.bodySmall?.copyWith(
                                color: context.colors.onSurfaceVariant,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        request.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.text.bodyMedium?.copyWith(
                          color: context.colors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                ServiceRequestPhotoThumbnail(
                  coverPhotoUrl: request.coverPhotoUrl,
                  photosCount: request.photosCount,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ServiceRequestPriceBlock(price: request.price),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: context.colors.primaryContainer,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.calendar_today_outlined,
                          size: 16,
                          color: context.colors.primary,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Creado el',
                              style: context.text.bodySmall?.copyWith(
                                color: context.colors.onSurfaceVariant,
                              ),
                            ),
                            Text(
                              formatShortDate(request.createdAt),
                              style: context.text.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: context.colors.onSurface,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: context.colors.onSurfaceVariant,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
