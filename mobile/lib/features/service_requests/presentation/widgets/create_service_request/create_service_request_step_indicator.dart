import 'package:flutter/material.dart';
import 'package:mobile/core/theme/app_color_extension.dart';
import 'package:mobile/core/theme/theme_context.dart';

class CreateServiceRequestStepIndicator extends StatelessWidget {
  final int currentStep;

  const CreateServiceRequestStepIndicator({
    super.key,
    required this.currentStep,
  });

  static const _steps = [
    '¿Qué necesitas?',
    '¿Dónde y cuánto?',
    'Fotos y confirmación',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var index = 0; index < _steps.length; index++) ...[
          if (index > 0)
            Expanded(
              child: Container(
                height: 2,
                margin: const EdgeInsets.only(bottom: 20),
                color:
                    currentStep >= index
                        ? context.colors.primary
                        : AppColors.light.border,
              ),
            ),
          Expanded(
            child: _StepItem(
              stepNumber: index + 1,
              label: _steps[index],
              isActive: currentStep == index,
              isCompleted: currentStep > index,
            ),
          ),
        ],
      ],
    );
  }
}

class _StepItem extends StatelessWidget {
  final int stepNumber;
  final String label;
  final bool isActive;
  final bool isCompleted;

  const _StepItem({
    required this.stepNumber,
    required this.label,
    required this.isActive,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final isHighlighted = isActive || isCompleted;
    final circleColor =
        isHighlighted
            ? context.colors.primary
            : context.colors.surfaceContainerHighest;
    final textColor =
        isHighlighted
            ? context.colors.primary
            : context.colors.onSurfaceVariant;
    final numberColor =
        isHighlighted
            ? context.colors.onPrimary
            : context.colors.onSurfaceVariant;

    return Column(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: circleColor,
            shape: BoxShape.circle,
            border:
                isHighlighted
                    ? null
                    : Border.all(color: AppColors.light.border),
          ),
          alignment: Alignment.center,
          child: Text(
            '$stepNumber',
            style: context.text.labelLarge?.copyWith(
              color: numberColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: context.text.bodySmall?.copyWith(
            color: textColor,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
