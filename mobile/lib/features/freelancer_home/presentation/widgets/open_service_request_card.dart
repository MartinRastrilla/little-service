import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/core/utils/formatters.dart';
import 'package:mobile/features/freelancer_home/domain/entities/open_service_request_summary.dart';
import 'package:mobile/features/freelancer_home/presentation/mappers/open_service_request_badge_resolver.dart';
import 'package:mobile/features/freelancer_home/presentation/widgets/open_service_request_badge.dart';
import 'package:mobile/features/service_requests/presentation/widgets/service_request_photo_thumbnail.dart';

class OpenServiceRequestCard extends StatelessWidget {
  final OpenServiceRequestSummary request;

  const OpenServiceRequestCard({
    super.key,
    required this.request,
  });

  @override
  Widget build(BuildContext context) {
    final badge = resolveOpenServiceRequestBadge(request);
    final priceLabel = request.price != null
        ? formatArsPrice(request.price!)
        : 'Precio a convenir';

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      color: context.colors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: context.colors.outline.withValues(alpha: 0.4)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 92,
                  height: 92,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: ServiceRequestPhotoThumbnail(
                          coverPhotoUrl: request.coverPhotoUrl,
                          photosCount: request.photosCount,
                        ),
                      ),
                      if (badge != null)
                        Positioned(
                          top: -4,
                          left: -4,
                          child: OpenServiceRequestBadge(data: badge),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              request.title,
                              style: context.text.titleSmall?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: context.colors.onSurface,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            formatRelativeTime(request.createdAt),
                            style: context.text.labelSmall?.copyWith(
                              color: context.colors.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 14,
                            color: context.colors.onSurfaceVariant,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              request.location.trim(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: context.text.bodySmall?.copyWith(
                                color: context.colors.onSurfaceVariant,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        request.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.text.bodySmall?.copyWith(
                          color: context.colors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 4,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                _MetadataItem(
                  icon: Icons.attach_money,
                  label: priceLabel,
                  highlight: request.price != null,
                ),
                _MetadataItem(
                  icon: Icons.photo_outlined,
                  label: '${request.photosCount} fotos',
                ),
                _MetadataItem(
                  icon: Icons.people_outline,
                  label: '${request.applicationsCount} postulaciones',
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.bookmark_border,
                    color: context.colors.onSurfaceVariant.withValues(alpha: 0.4),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: FilledButton(
                      onPressed: null,
                      style: FilledButton.styleFrom(
                        disabledBackgroundColor:
                            context.colors.primary.withValues(alpha: 0.4),
                        disabledForegroundColor:
                            context.colors.onPrimary.withValues(alpha: 0.7),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text('Ver detalle'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MetadataItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool highlight;

  const _MetadataItem({
    required this.icon,
    required this.label,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = highlight
        ? const Color(0xFF1B8A5A)
        : context.colors.onSurfaceVariant;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: textColor),
        const SizedBox(width: 4),
        Text(
          label,
          style: context.text.labelSmall?.copyWith(
            color: textColor,
            fontWeight: highlight ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
