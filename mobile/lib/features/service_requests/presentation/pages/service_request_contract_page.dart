import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/app/di.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/core/utils/formatters.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_contract.dart';
import 'package:mobile/features/service_requests/presentation/bloc/contract_form/contract_form_bloc.dart';
import 'package:mobile/features/service_requests/presentation/bloc/contract_form/contract_form_event.dart';
import 'package:mobile/features/service_requests/presentation/bloc/contract_form/contract_form_state.dart';
import 'package:mobile/features/service_requests/presentation/validators/contract_validators.dart';
import 'package:mobile/features/service_requests/presentation/widgets/create_service_request/create_service_request_labeled_field.dart';

class ServiceRequestContractPage extends StatelessWidget {
  final String serviceRequestId;
  final double? suggestedAmount;
  final bool allowCreate;

  const ServiceRequestContractPage({
    super.key,
    required this.serviceRequestId,
    this.suggestedAmount,
    this.allowCreate = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ContractFormBloc>()
        ..add(
          ContractFormEvent.started(
            serviceRequestId: serviceRequestId,
            suggestedAmount: suggestedAmount,
            allowCreate: allowCreate,
          ),
        ),
      child: const _ServiceRequestContractView(),
    );
  }
}

class _ServiceRequestContractView extends StatefulWidget {
  const _ServiceRequestContractView();

  @override
  State<_ServiceRequestContractView> createState() =>
      _ServiceRequestContractViewState();
}

class _ServiceRequestContractViewState
    extends State<_ServiceRequestContractView> {
  final _formKey = GlobalKey<FormState>();
  final _termsController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;
  var _initialized = false;
  var _didMutate = false;

  @override
  void dispose() {
    _termsController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _syncFromState(ContractFormReady state) {
    if (_initialized) return;

    final contract = state.contract;
    if (contract != null) {
      _termsController.text = contract.terms;
      _amountController.text = contract.amount.round().toString();
      _startDate = _dateOnly(contract.startDate);
      _endDate = _dateOnly(contract.endDate);
    } else {
      final today = DateTime.now();
      _startDate = DateTime(today.year, today.month, today.day);
      _endDate = _startDate!.add(const Duration(days: 7));
      if (state.suggestedAmount != null) {
        _amountController.text = state.suggestedAmount!.round().toString();
      }
    }
    _initialized = true;
  }

  double? _parseAmount(String value) {
    final cleaned = value.replaceAll('.', '').replaceAll(',', '.').trim();
    if (cleaned.isEmpty) return null;
    return double.tryParse(cleaned);
  }

  DateTime _dateOnly(DateTime date) {
    final utc = date.toUtc();
    return DateTime(utc.year, utc.month, utc.day);
  }

  DateTime _toUtcDate(DateTime date) {
    return DateTime.utc(date.year, date.month, date.day, 12);
  }

  Future<void> _pickDate({required bool isStart}) async {
    final initial = (isStart ? _startDate : _endDate) ?? DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked == null) return;
    setState(() {
      if (isStart) {
        _startDate = picked;
        if (_endDate != null && !_endDate!.isAfter(picked)) {
          _endDate = picked.add(const Duration(days: 1));
        }
      } else {
        _endDate = picked;
      }
    });
  }

  void _submit(BuildContext context) {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final amount = _parseAmount(_amountController.text);
    final datesError = validateContractDates(_startDate, _endDate);
    if (datesError != null) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(datesError.message)));
      return;
    }

    context.read<ContractFormBloc>().add(
      ContractFormEvent.saveRequested(
        terms: _termsController.text,
        startDate: _toUtcDate(_startDate!),
        endDate: _toUtcDate(_endDate!),
        amount: amount ?? 0,
      ),
    );
  }

  Future<void> _confirmSign(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('¿Firmar el contrato?'),
          content: const Text(
            'Al firmar no vas a poder editar los términos. '
            'Esta acción no se puede deshacer.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: const Text('Volver'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: const Text('Firmar'),
            ),
          ],
        );
      },
    );
    if (confirmed != true || !context.mounted) return;
    context.read<ContractFormBloc>().add(const ContractFormEvent.signRequested());
  }

  Future<void> _confirmCancel(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('¿Anular las firmas?'),
          content: const Text(
            'Se elimina este contrato y las firmas. El profesional se mantiene '
            'asignado. El cliente deberá crear un contrato nuevo.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: const Text('Volver'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(dialogContext).colorScheme.error,
                foregroundColor: Theme.of(dialogContext).colorScheme.onError,
              ),
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: const Text('Anular firmas'),
            ),
          ],
        );
      },
    );
    if (confirmed != true || !context.mounted) return;
    context.read<ContractFormBloc>().add(
      const ContractFormEvent.cancelRequested(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        Navigator.of(context).pop(_didMutate);
      },
      child: BlocConsumer<ContractFormBloc, ContractFormState>(
        listenWhen: (previous, current) {
          if (previous is! ContractFormReady || current is! ContractFormReady) {
            return false;
          }
          return previous.isSaving &&
              !current.isSaving &&
              current.errorMessage == null;
        },
        listener: (context, state) {
          if (state is! ContractFormReady || !context.mounted) return;
          _didMutate = true;
          if (state.shouldPop) {
            context.pop(true);
          }
        },
        builder: (context, state) {
          return switch (state) {
            ContractFormInitial() || ContractFormLoading() => Scaffold(
              appBar: AppBar(title: const Text('Contrato')),
              body: const Center(child: CircularProgressIndicator()),
            ),
            ContractFormFailure(:final message) => Scaffold(
              appBar: AppBar(title: const Text('Contrato')),
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Text(message, textAlign: TextAlign.center),
                ),
              ),
            ),
            ContractFormReady() => _buildReady(context, state),
          };
        },
      ),
    );
  }

  Widget _buildReady(BuildContext context, ContractFormReady state) {
    _syncFromState(state);

    if (state.contract == null && !state.canCreate) {
      return Scaffold(
        appBar: AppBar(title: const Text('Contrato')),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(32),
            child: Text(
              'El cliente todavía no creó el contrato de este pedido.',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    final contract = state.contract;
    final isEditable = state.canCreate || state.canEdit;
    final title = contract == null ? 'Crear contrato' : 'Contrato';
    final canSign = contract?.canSign == true;
    final canCancelPartial = contract?.canCancelPartial == true;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
              children: [
                Text(
                  _hintText(
                    isEditable: isEditable,
                    status: contract?.status,
                  ),
                  style: context.text.bodyMedium?.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 20),
                IgnorePointer(
                  ignoring: !isEditable,
                  child: CreateServiceRequestLabeledField(
                    controller: _termsController,
                    label: 'Términos y cláusulas',
                    helperText:
                        'Describí el alcance acordado con el profesional',
                    hintText:
                        'Ej: incluye materiales, horarios, condiciones...',
                    maxLength: maxContractTermsLength,
                    minLines: 6,
                    maxLines: 12,
                    validator: (value) =>
                        validateContractTerms(value)?.message,
                  ),
                ),
                const SizedBox(height: 20),
                IgnorePointer(
                  ignoring: !isEditable,
                  child: _DateField(
                    label: 'Fecha de inicio',
                    value: _startDate,
                    enabled: isEditable,
                    onTap: () => _pickDate(isStart: true),
                  ),
                ),
                const SizedBox(height: 16),
                IgnorePointer(
                  ignoring: !isEditable,
                  child: _DateField(
                    label: 'Fecha de fin',
                    value: _endDate,
                    enabled: isEditable,
                    onTap: () => _pickDate(isStart: false),
                  ),
                ),
                const SizedBox(height: 20),
                IgnorePointer(
                  ignoring: !isEditable,
                  child: CreateServiceRequestLabeledField(
                    controller: _amountController,
                    label: 'Monto acordado',
                    helperText: state.suggestedAmount != null
                        ? 'Precio sugerido del pedido: ${formatArsPrice(state.suggestedAmount!)}'
                        : 'Confirmá el monto acordado con el profesional',
                    hintText: '0',
                    maxLength: 12,
                    keyboardType: TextInputType.number,
                    prefixIcon: const Icon(Icons.attach_money),
                    validator: (value) => validateContractAmount(
                      _parseAmount(value ?? ''),
                    )?.message,
                  ),
                ),
                if (contract != null) ...[
                  const SizedBox(height: 20),
                  Text(
                    _statusCopy(contract),
                    style: context.text.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
                if (state.errorMessage != null) ...[
                  const SizedBox(height: 16),
                  Text(
                    state.errorMessage!,
                    style: context.text.bodyMedium?.copyWith(
                      color: context.colors.error,
                    ),
                  ),
                ],
                if (isEditable) ...[
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: state.isSaving ? null : () => _submit(context),
                    child: Text(
                      contract == null ? 'Crear contrato' : 'Guardar cambios',
                    ),
                  ),
                ],
                if (canSign) ...[
                  SizedBox(height: isEditable ? 12 : 24),
                  FilledButton(
                    onPressed: state.isSaving
                        ? null
                        : () => _confirmSign(context),
                    child: const Text('Firmar'),
                  ),
                ],
                if (canCancelPartial) ...[
                  const SizedBox(height: 12),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: context.colors.error,
                    ),
                    onPressed: state.isSaving
                        ? null
                        : () => _confirmCancel(context),
                    child: const Text('Anular firmas'),
                  ),
                ],
              ],
            ),
          ),
          if (state.isSaving)
            Container(
              color: context.colors.surface.withValues(alpha: 0.6),
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }

  String _hintText({required bool isEditable, required String? status}) {
    if (isEditable) {
      return 'Si el profesional pide cambios, actualizá el contrato. '
          'El chat es el canal de negociación.';
    }
    if (status == null || status == 'Draft') {
      return 'Pedí cambios por el chat. El cliente actualizará el contrato.';
    }
    if (status == 'SignedByClient' || status == 'SignedByFreelancer') {
      return 'Los términos ya no se pueden editar. Podés anular las firmas '
          'o completar la firma que falta.';
    }
    return 'El contrato está firmado por ambas partes.';
  }

  String _statusCopy(ServiceRequestContract contract) {
    final clientSigned = contract.signedByClientAt != null
        ? 'Cliente: ${formatDetailDateTime(contract.signedByClientAt!)}'
        : null;
    final freelancerSigned = contract.signedByFreelancerAt != null
        ? 'Profesional: ${formatDetailDateTime(contract.signedByFreelancerAt!)}'
        : null;
    final timestamps = [
      if (clientSigned != null) clientSigned,
      if (freelancerSigned != null) freelancerSigned,
    ].join('\n');

    final summary = switch (contract.status) {
      'Draft' => 'Borrador. Todavía se pueden editar los términos.',
      'SignedByClient' =>
        'Pendiente de firma del profesional.',
      'SignedByFreelancer' => 'Pendiente de firma del cliente.',
      'Signed' => 'Firmado por ambas partes.',
      _ => 'Estado: ${contract.status}',
    };

    if (timestamps.isEmpty) return summary;
    return '$summary\n$timestamps';
  }
}

class _DateField extends StatelessWidget {
  final String label;
  final DateTime? value;
  final bool enabled;
  final VoidCallback onTap;

  const _DateField({
    required this.label,
    required this.value,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: context.text.titleSmall?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        Material(
          color: context.colors.surface,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            onTap: enabled ? onTap : null,
            borderRadius: BorderRadius.circular(12),
            child: InputDecorator(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.calendar_today_outlined),
              ),
              child: Text(
                value == null ? 'Elegí una fecha' : formatShortDate(value!),
                style: context.text.bodyMedium,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
