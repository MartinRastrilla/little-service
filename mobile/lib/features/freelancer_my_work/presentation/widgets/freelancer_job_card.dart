import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/core/utils/formatters.dart';
import 'package:mobile/features/freelancer_my_work/domain/entities/freelancer_work_item.dart';
import 'package:mobile/features/freelancer_my_work/presentation/mappers/freelancer_my_work_mappers.dart';
import 'package:mobile/features/freelancer_my_work/presentation/widgets/job_in_progress_info_banner.dart';
import 'package:mobile/features/service_requests/presentation/widgets/service_request_photo_thumbnail.dart';

class FreelancerJobCard extends StatelessWidget {
  final FreelancerWorkItem item;

  const FreelancerJobCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final badge = resolveJobBadgeStyle(item.displayStatus);
    final isInProgress = item.displayStatus == 'En curso';
    final priceValue = item.hasContract && item.contractAmount != null
        ? formatArsPrice(item.contractAmount!)
        : (item.price != null ? formatArsPrice(item.price!) : 'Precio a convenir');
    final contractLabel = resolveContractStartLabel(
      hasContract: item.hasContract,
      contractStartDate: item.contractStartDate,
      formatDate: formatShortDate,
    );

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
                          coverPhotoUrl: item.coverPhotoUrl,
                          photosCount: item.photosCount,
                        ),
                      ),
                      Positioned(
                        top: -4,
                        left: -4,
                        child: Container(
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
                              item.title,
                              style: context.text.titleSmall?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            formatRelativeTime(item.createdAt),
                            style: context.text.labelSmall?.copyWith(
                              color: context.colors.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                      if (item.clientName != null) ...[
                        const SizedBox(height: 6),
                        Text(
                          item.clientName!,
                          style: context.text.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
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
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: context.colors.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _MetricColumn(
                      icon: Icons.attach_money,
                      value: priceValue,
                      label: 'Precio acordado',
                      highlight: true,
                    ),
                  ),
                  Expanded(
                    child: _MetricColumn(
                      icon: Icons.chat_bubble_outline,
                      value: item.unreadMessagesCount > 0
                          ? '${item.unreadMessagesCount}'
                          : null,
                      label: 'Mensajes',
                      showBadge: item.unreadMessagesCount > 0,
                    ),
                  ),
                  Expanded(
                    child: _MetricColumn(
                      icon: Icons.calendar_today_outlined,
                      value: null,
                      label: contractLabel,
                      multilineLabel: true,
                    ),
                  ),
                ],
              ),
            ),
            if (isInProgress) ...[
              const SizedBox(height: 12),
              const JobInProgressInfoBanner(),
            ],
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.end,
                children: [
                  if (item.hasContract)
                    OutlinedButton(
                      onPressed: () => context.push(
                        '/freelancer/jobs/${item.id}/contract',
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Ver contrato'),
                          SizedBox(width: 4),
                          Icon(Icons.description_outlined, size: 18),
                        ],
                      ),
                    ),
                  OutlinedButton(
                    onPressed: () => context.push(
                      '/chat/service-requests/${item.id}',
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Abrir chat'),
                        SizedBox(width: 4),
                        Icon(Icons.chevron_right, size: 18),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricColumn extends StatelessWidget {
  final IconData icon;
  final String? value;
  final String label;
  final bool highlight;
  final bool showBadge;
  final bool multilineLabel;

  const _MetricColumn({
    required this.icon,
    required this.label,
    this.value,
    this.highlight = false,
    this.showBadge = false,
    this.multilineLabel = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Icon(
              icon,
              size: 18,
              color: highlight
                  ? context.appColors.success
                  : context.colors.onSurfaceVariant,
            ),
            if (showBadge && value != null)
              Positioned(
                right: -8,
                top: -6,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: context.colors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    value!,
                    style: context.text.labelSmall?.copyWith(
                      color: context.colors.onPrimary,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        if (value != null && !showBadge)
          Text(
            value!,
            style: context.text.labelMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: highlight ? context.appColors.success : null,
            ),
          ),
        Text(
          label,
          textAlign: TextAlign.center,
          maxLines: multilineLabel ? 2 : 1,
          overflow: TextOverflow.ellipsis,
          style: context.text.labelSmall?.copyWith(
            color: context.colors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
