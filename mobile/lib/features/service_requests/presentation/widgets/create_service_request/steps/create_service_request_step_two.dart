import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/features/service_requests/presentation/bloc/create_service_request/create_service_request_bloc.dart';
import 'package:mobile/features/service_requests/presentation/bloc/create_service_request/create_service_request_event.dart';
import 'package:mobile/features/service_requests/presentation/validators/create_service_request_validators.dart';
import 'package:mobile/features/service_requests/presentation/widgets/create_service_request/create_service_request_budget_option_card.dart';
import 'package:mobile/features/service_requests/presentation/widgets/create_service_request/create_service_request_labeled_field.dart';
import 'package:mobile/features/service_requests/presentation/widgets/create_service_request/create_service_request_section_header.dart';

enum CreateServiceRequestBudgetMode { estimated, toBeAgreed }

class CreateServiceRequestStepTwo extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController locationController;
  final TextEditingController priceController;
  final CreateServiceRequestBudgetMode initialBudgetMode;
  final String? stepError;

  const CreateServiceRequestStepTwo({
    super.key,
    required this.formKey,
    required this.locationController,
    required this.priceController,
    required this.initialBudgetMode,
    this.stepError,
  });

  @override
  State<CreateServiceRequestStepTwo> createState() =>
      CreateServiceRequestStepTwoState();
}

class CreateServiceRequestStepTwoState extends State<CreateServiceRequestStepTwo> {
  late CreateServiceRequestBudgetMode _budgetMode;

  @override
  void initState() {
    super.initState();
    _budgetMode = widget.initialBudgetMode;
  }

  @override
  void didUpdateWidget(CreateServiceRequestStepTwo oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialBudgetMode != widget.initialBudgetMode) {
      _budgetMode = widget.initialBudgetMode;
    }
  }

  double? _parsePrice(String value) {
    final cleaned = value.replaceAll('.', '').replaceAll(',', '.').trim();
    if (cleaned.isEmpty) return null;
    return double.tryParse(cleaned);
  }

  void submit(BuildContext context) {
    if (!widget.formKey.currentState!.validate()) return;

    double? price;
    if (_budgetMode == CreateServiceRequestBudgetMode.estimated) {
      price = _parsePrice(widget.priceController.text);
      final priceError = validateServiceRequestPrice(price);
      if (priceError != null || price == null) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(
                priceError?.message ?? 'Ingresá un monto estimado válido',
              ),
            ),
          );
        return;
      }
    }

    context.read<CreateServiceRequestBloc>().add(
      CreateServiceRequestEvent.stepTwoSubmitted(
        location: widget.locationController.text,
        price: price,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CreateServiceRequestSectionHeader(
            icon: Icons.location_on_outlined,
            title: '¿Dónde y cuánto será el trabajo?',
            subtitle:
                'Esta información ayuda a los profesionales a evaluar tu pedido.',
          ),
          const SizedBox(height: 24),
          CreateServiceRequestLabeledField(
            controller: widget.locationController,
            label: 'Ubicación',
            hintText: 'Ej. Palermo, Buenos Aires',
            helperText: 'Indica el lugar donde se realizará el trabajo.',
            maxLength: 500,
            prefixIcon: Icon(
              Icons.location_on_outlined,
              color: context.colors.onSurfaceVariant,
            ),
            validator: (value) =>
                validateServiceRequestLocation(value)?.message,
          ),
          const SizedBox(height: 24),
          Text(
            'Presupuesto *',
            style: context.text.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: context.colors.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Cuéntanos si tienes un presupuesto estimado.',
            style: context.text.bodySmall?.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 12),
          CreateServiceRequestBudgetOptionCard(
            icon: Icons.account_balance_wallet_outlined,
            title: 'Tengo un presupuesto estimado',
            description:
                'Ingresa el monto aproximado que tienes en mente para este trabajo.',
            isSelected: _budgetMode == CreateServiceRequestBudgetMode.estimated,
            onTap: () => setState(
              () => _budgetMode = CreateServiceRequestBudgetMode.estimated,
            ),
            child: _budgetMode == CreateServiceRequestBudgetMode.estimated
                ? TextFormField(
                    controller: widget.priceController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      hintText: 'Ej. 35000',
                      prefixIcon: Icon(
                        Icons.attach_money,
                        color: context.colors.onSurfaceVariant,
                      ),
                    ),
                  )
                : null,
          ),
          const SizedBox(height: 12),
          CreateServiceRequestBudgetOptionCard(
            icon: Icons.handshake_outlined,
            title: 'Prefiero acordarlo con el profesional',
            description:
                'Aún no tengo un presupuesto definido y quiero recibir propuestas.',
            isSelected: _budgetMode == CreateServiceRequestBudgetMode.toBeAgreed,
            onTap: () => setState(
              () => _budgetMode = CreateServiceRequestBudgetMode.toBeAgreed,
            ),
            child: _budgetMode == CreateServiceRequestBudgetMode.toBeAgreed
                ? Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: context.colors.primaryContainer.withValues(
                        alpha: 0.35,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info_outline,
                          size: 18,
                          color: context.colors.primary,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Podrás conversar y acordar el presupuesto con los profesionales que te postulen.',
                            style: context.text.bodySmall?.copyWith(
                              color: context.colors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : null,
          ),
          if (widget.stepError != null) ...[
            const SizedBox(height: 12),
            Text(
              widget.stepError!,
              style: context.text.bodySmall?.copyWith(
                color: context.colors.error,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
