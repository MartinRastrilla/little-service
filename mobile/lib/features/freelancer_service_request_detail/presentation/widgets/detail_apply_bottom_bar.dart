import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/features/freelancer_service_request_detail/presentation/mappers/apply_error_mapper.dart';

class DetailApplyBottomBar extends StatelessWidget {
  final DetailApplyButtonState state;
  final bool isLoading;
  final VoidCallback? onApplyPressed;

  const DetailApplyBottomBar({
    super.key,
    required this.state,
    required this.isLoading,
    this.onApplyPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isEnabled = state == DetailApplyButtonState.canApply && !isLoading;

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
      decoration: BoxDecoration(
        color: context.colors.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Material(
          color: isEnabled
              ? context.colors.primary
              : context.colors.primary.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(16),
          child: InkWell(
            onTap: isEnabled ? onApplyPressed : null,
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  if (isLoading)
                    SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: context.colors.onPrimary,
                      ),
                    )
                  else
                    Icon(
                      Icons.send_outlined,
                      color: context.colors.onPrimary.withValues(
                        alpha: isEnabled ? 1 : 0.7,
                      ),
                    ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          resolveApplyButtonLabel(state),
                          style: context.text.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: context.colors.onPrimary.withValues(
                              alpha: isEnabled ? 1 : 0.7,
                            ),
                          ),
                        ),
                        if (state == DetailApplyButtonState.canApply)
                          Text(
                            'Es gratis y el cliente lo verá',
                            style: context.text.bodySmall?.copyWith(
                              color: context.colors.onPrimary.withValues(
                                alpha: 0.85,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: context.colors.onPrimary.withValues(
                      alpha: isEnabled ? 1 : 0.7,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
