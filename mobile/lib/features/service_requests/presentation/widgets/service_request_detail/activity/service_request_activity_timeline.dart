import 'package:flutter/material.dart';
import 'package:mobile/core/theme/app_colors.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/core/utils/formatters.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_activity.dart';

class ServiceRequestActivityTimeline extends StatelessWidget {
  final List<ServiceRequestTimelineStep> steps;

  const ServiceRequestActivityTimeline({
    super.key,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: context.colors.outline.withValues(alpha: 0.35),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Estado y progreso',
            style: context.text.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: context.colors.onSurface,
            ),
          ),
          const SizedBox(height: 16),
          ...List.generate(steps.length, (index) {
            final step = steps[index];
            final isLast = index == steps.length - 1;

            return _TimelineStepRow(
              step: step,
              isLast: isLast,
              showInProgressLabel: step.status == 'current',
            );
          }),
        ],
      ),
    );
  }
}

class _TimelineStepRow extends StatelessWidget {
  final ServiceRequestTimelineStep step;
  final bool isLast;
  final bool showInProgressLabel;

  const _TimelineStepRow({
    required this.step,
    required this.isLast,
    required this.showInProgressLabel,
  });

  @override
  Widget build(BuildContext context) {
    final isCompleted = step.status == 'completed';
    final isCurrent = step.status == 'current';

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 28,
            child: Column(
              children: [
                _TimelineIndicator(
                  isCompleted: isCompleted,
                  isCurrent: isCurrent,
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: isCompleted
                          ? AppPalette.success
                          : context.colors.outline.withValues(alpha: 0.35),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                step.title,
                                style: context.text.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: isCurrent
                                      ? context.colors.primary
                                      : context.colors.onSurface,
                                ),
                              ),
                            ),
                            if (showInProgressLabel)
                              Text(
                                'En curso',
                                style: context.text.labelSmall?.copyWith(
                                  color: context.colors.primary,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          step.subtitle,
                          style: context.text.bodySmall?.copyWith(
                            color: context.colors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (step.occurredAt != null) ...[
                    const SizedBox(width: 8),
                    Text(
                      formatTimelineTimestamp(step.occurredAt!),
                      style: context.text.bodySmall?.copyWith(
                        color: context.colors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineIndicator extends StatelessWidget {
  final bool isCompleted;
  final bool isCurrent;

  const _TimelineIndicator({
    required this.isCompleted,
    required this.isCurrent,
  });

  @override
  Widget build(BuildContext context) {
    if (isCompleted) {
      return Container(
        width: 24,
        height: 24,
        decoration: const BoxDecoration(
          color: AppPalette.success,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.check,
          size: 14,
          color: Colors.white,
        ),
      );
    }

    if (isCurrent) {
      return Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: context.colors.primary,
          shape: BoxShape.circle,
        ),
      );
    }

    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: context.colors.outline.withValues(alpha: 0.5),
          width: 2,
        ),
      ),
    );
  }
}
