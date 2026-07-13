import 'package:flutter/material.dart';
import 'package:mobile/core/theme/theme_context.dart';

class RegisterStepIndicator extends StatelessWidget {
  final int currentStep;

  const RegisterStepIndicator({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _StepItem(
            stepNumber: 1,
            label: 'Datos de la cuenta',
            isActive: currentStep == 0,
            isCompleted: currentStep > 0,
          ),
        ),
        Expanded(
          child: Container(
            height: 2,
            margin: const EdgeInsets.only(bottom: 20),
            color: currentStep > 0
                ? context.colors.primary
                : context.colors.outlineVariant,
          ),
        ),
        Expanded(
          child: _StepItem(
            stepNumber: 2,
            label: 'Selecciona tu rol',
            isActive: currentStep == 1,
            isCompleted: false,
          ),
        ),
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
    final circleColor = isHighlighted
        ? context.colors.primary
        : context.colors.surfaceContainerHighest;
    final textColor = isHighlighted
        ? context.colors.primary
        : context.colors.onSurfaceVariant;
    final numberColor = isHighlighted
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
        ),
      ],
    );
  }
}
