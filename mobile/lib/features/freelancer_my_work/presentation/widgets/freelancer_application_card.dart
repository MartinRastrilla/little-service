import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/core/utils/formatters.dart';
import 'package:mobile/features/freelancer_my_work/domain/entities/freelancer_work_item.dart';
import 'package:mobile/features/freelancer_my_work/presentation/mappers/freelancer_my_work_mappers.dart';
import 'package:mobile/features/freelancer_my_work/presentation/widgets/application_rejected_banner.dart';
import 'package:mobile/features/service_requests/presentation/widgets/service_request_photo_thumbnail.dart';

class FreelancerApplicationCard extends StatelessWidget {
  final FreelancerWorkItem item;

  const FreelancerApplicationCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final badge = resolveApplicationBadgeStyle(item.displayStatus);
    final priceLabel =
        item.price != null ? formatArsPrice(item.price!) : 'Precio a convenir';
    final ctaEnabled = isApplicationCtaEnabled(item.canViewApplicationDetail);
    final ctaLabel = resolveApplicationCtaLabel(
      applicationStatus: item.applicationStatus,
      canViewApplicationDetail: item.canViewApplicationDetail,
    );
    final isRejected = item.applicationStatus?.toLowerCase() == 'rejected';

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: badge.backgroundColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    badge.label,
                    style: context.text.labelSmall?.copyWith(
                      color: badge.textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  formatRelativeTime(item.createdAt),
                  style: context.text.labelSmall?.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 92,
                  height: 92,
                  child: ServiceRequestPhotoThumbnail(
                    coverPhotoUrl: item.coverPhotoUrl,
                    photosCount: item.photosCount,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      Text(
                        item.title,
                        style: context.text.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
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
                              item.location.trim(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
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
            Wrap(
              spacing: 12,
              runSpacing: 4,
              children: [
                _MetadataChip(
                  icon: Icons.attach_money,
                  label: priceLabel,
                  highlight: item.price != null,
                ),
                _MetadataChip(
                  icon: Icons.photo_outlined,
                  label: '${item.photosCount} fotos',
                ),
                _MetadataChip(
                  icon: Icons.people_outline,
                  label: '${item.applicationsCount} postulaciones',
                ),
              ],
            ),
            if (isRejected) ...[
              const SizedBox(height: 12),
              const ApplicationRejectedBanner(),
            ],
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Text(
                    item.applicationCreatedAt != null
                        ? 'Postulaste: ${formatShortDate(item.applicationCreatedAt!)}'
                        : '',
                    style: context.text.bodySmall?.copyWith(
                      color: context.colors.onSurfaceVariant,
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed:
                      ctaEnabled
                          ? () => context.push(
                            '/freelancer/service-requests/${item.id}',
                          )
                          : null,
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(ctaLabel),
                      const SizedBox(width: 4),
                      const Icon(Icons.chevron_right, size: 18),
                    ],
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

class _MetadataChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool highlight;

  const _MetadataChip({
    required this.icon,
    required this.label,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color:
            highlight
                ? context.appColors.success.withValues(alpha: 0.12)
                : context.colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14,
            color:
                highlight
                    ? context.appColors.success
                    : context.colors.onSurfaceVariant,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: context.text.labelSmall?.copyWith(
              color:
                  highlight
                      ? context.appColors.success
                      : context.colors.onSurfaceVariant,
              fontWeight: highlight ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
