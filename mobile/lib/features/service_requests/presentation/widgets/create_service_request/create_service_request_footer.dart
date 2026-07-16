import 'package:flutter/material.dart';
import 'package:mobile/core/theme/app_color_extension.dart';
import 'package:mobile/core/theme/theme_context.dart';

class CreateServiceRequestFooter extends StatelessWidget {
  final int currentStep;
  final bool isLoading;
  final VoidCallback? onBack;
  final VoidCallback? onContinue;

  const CreateServiceRequestFooter({
    super.key,
    required this.currentStep,
    required this.isLoading,
    this.onBack,
    this.onContinue,
  });

  static const _totalSteps = 3;

  @override
  Widget build(BuildContext context) {
    final isLastStep = currentStep == _totalSteps - 1;
    final continueLabel = isLastStep ? 'Crear pedido' : 'Continuar';

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
      decoration: BoxDecoration(
        color: context.colors.surface,
        border: Border(top: BorderSide(color: AppColors.light.border)),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            if (currentStep > 0)
              SizedBox(
                width: 96,
                child: OutlinedButton(
                  onPressed: isLoading ? null : onBack,
                  child: const Text('Volver'),
                ),
              )
            else
              const SizedBox(width: 96),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Paso ${currentStep + 1} de $_totalSteps',
                    style: context.text.bodySmall?.copyWith(
                      color: context.colors.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_totalSteps, (index) {
                      final isActive = index == currentStep;
                      return Container(
                        width: isActive ? 10 : 6,
                        height: isActive ? 10 : 6,
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                          color:
                              index <= currentStep
                                  ? context.colors.primary
                                  : AppColors.light.border,
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: isLastStep ? 140 : 120,
              height: 44,
              child: FilledButton(
                onPressed: isLoading ? null : onContinue,
                child:
                    isLoading
                        ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                        : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text(
                                continueLabel,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (!isLastStep) ...[
                              const SizedBox(width: 4),
                              const Icon(Icons.arrow_forward, size: 18),
                            ],
                          ],
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
