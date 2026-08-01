import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/app/di.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/features/service_requests/domain/entities/edit_service_request_draft.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_info.dart';
import 'package:mobile/features/service_requests/presentation/bloc/edit_service_request/edit_service_request_bloc.dart';
import 'package:mobile/features/service_requests/presentation/bloc/edit_service_request/edit_service_request_event.dart';
import 'package:mobile/features/service_requests/presentation/bloc/edit_service_request/edit_service_request_state.dart';
import 'package:mobile/features/service_requests/presentation/validators/create_service_request_validators.dart';
import 'package:mobile/features/service_requests/presentation/widgets/create_service_request/create_service_request_budget_option_card.dart';
import 'package:mobile/features/service_requests/presentation/widgets/create_service_request/create_service_request_labeled_field.dart';
import 'package:mobile/features/service_requests/presentation/widgets/create_service_request/create_service_request_section_header.dart';
import 'package:mobile/features/service_requests/presentation/widgets/create_service_request/steps/create_service_request_step_two.dart';
import 'package:mobile/features/service_requests/presentation/widgets/edit_service_request/cancel_service_request_dialog.dart';
import 'package:mobile/features/service_requests/presentation/widgets/edit_service_request/edit_service_request_photo_section.dart';

class EditServiceRequestPage extends StatefulWidget {
  final String serviceRequestId;

  const EditServiceRequestPage({
    super.key,
    required this.serviceRequestId,
  });

  @override
  State<EditServiceRequestPage> createState() => _EditServiceRequestPageState();
}

class _EditServiceRequestPageState extends State<EditServiceRequestPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  final _priceController = TextEditingController();

  CreateServiceRequestBudgetMode _budgetMode =
      CreateServiceRequestBudgetMode.toBeAgreed;
  var _isDirty = false;
  var _initialized = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _syncFromDraft(EditServiceRequestDraft draft) {
    if (_initialized &&
        _titleController.text == draft.title &&
        _descriptionController.text == draft.description &&
        _locationController.text == draft.location) {
      return;
    }

    _titleController.text = draft.title;
    _descriptionController.text = draft.description;
    _locationController.text = draft.location;
    if (draft.priceMode == ServiceRequestPriceMode.estimated &&
        draft.price != null) {
      _priceController.text = draft.price!.toInt().toString();
      _budgetMode = CreateServiceRequestBudgetMode.estimated;
    } else {
      _priceController.clear();
      _budgetMode = CreateServiceRequestBudgetMode.toBeAgreed;
    }
    _initialized = true;
  }

  double? _parsePrice(String value) {
    final cleaned = value.replaceAll('.', '').replaceAll(',', '.').trim();
    if (cleaned.isEmpty) return null;
    return double.tryParse(cleaned);
  }

  void _notifyFieldChanges(BuildContext context) {
    context.read<EditServiceRequestBloc>().add(
      EditServiceRequestEvent.fieldChanged(
        title: _titleController.text,
        description: _descriptionController.text,
        location: _locationController.text,
      ),
    );
  }

  void _notifyBudgetModeChanged(BuildContext context) {
    double? price;
    if (_budgetMode == CreateServiceRequestBudgetMode.estimated) {
      price = _parsePrice(_priceController.text);
    }

    context.read<EditServiceRequestBloc>().add(
      EditServiceRequestEvent.budgetModeChanged(
        priceMode: _budgetMode == CreateServiceRequestBudgetMode.estimated
            ? ServiceRequestPriceMode.estimated
            : ServiceRequestPriceMode.toBeAgreed,
        price: price,
      ),
    );
  }

  Future<void> _confirmAbandon(BuildContext context) async {
    if (!_isDirty) {
      context.pop();
      return;
    }

    final shouldLeave = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('¿Salir sin guardar?'),
        content: const Text(
          'Si sales ahora, perderás los cambios que hiciste en este pedido.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Salir'),
          ),
        ],
      ),
    );

    if (shouldLeave == true && context.mounted) {
      context.pop();
    }
  }

  Future<void> _onSave(BuildContext context) async {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;

    double? price;
    if (_budgetMode == CreateServiceRequestBudgetMode.estimated) {
      price = _parsePrice(_priceController.text);
    }

    context.read<EditServiceRequestBloc>().add(
      EditServiceRequestEvent.saveRequested(
        title: _titleController.text,
        description: _descriptionController.text,
        location: _locationController.text,
        priceMode: _budgetMode == CreateServiceRequestBudgetMode.estimated
            ? ServiceRequestPriceMode.estimated
            : ServiceRequestPriceMode.toBeAgreed,
        price: price,
      ),
    );
  }

  Future<void> _onCancelOrder(BuildContext context) async {
    final state = context.read<EditServiceRequestBloc>().state;
    final info = state.mapOrNull(editing: (value) => value.info);
    if (info == null) return;

    if (!info.canCancel) {
      await showEditBlockedDialog(
        context,
        message: info.cancelBlockedReason ??
            'Este pedido no se puede cancelar',
      );
      return;
    }

    final confirmed = await showCancelServiceRequestDialog(context);
    if (confirmed != true || !context.mounted) return;

    context.read<EditServiceRequestBloc>().add(
      const EditServiceRequestEvent.cancelRequested(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<EditServiceRequestBloc>()
        ..add(
          EditServiceRequestEvent.started(
            serviceRequestId: widget.serviceRequestId,
          ),
        ),
      child: Builder(
        builder: (context) {
          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, _) {
              if (!didPop) {
                _confirmAbandon(context);
              }
            },
            child: Scaffold(
              backgroundColor: context.colors.surfaceContainerLow,
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => _confirmAbandon(context),
                ),
                centerTitle: true,
                title: Text(
                  'Editar pedido',
                  style: context.text.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              body: BlocConsumer<EditServiceRequestBloc, EditServiceRequestState>(
                listener: (context, state) {
                  state.whenOrNull(
                    editing: (info, draft, _, isDirty, fieldError) {
                      _syncFromDraft(draft);
                      if (_isDirty != isDirty) {
                        setState(() => _isDirty = isDirty);
                      }
                      if (fieldError != null) {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(SnackBar(content: Text(fieldError)));
                      }
                    },
                    saveSuccess: () {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          const SnackBar(content: Text('Pedido actualizado')),
                        );
                      context.pop(true);
                    },
                    cancelSuccess: () {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          const SnackBar(content: Text('Pedido cancelado')),
                        );
                      context.go('/shell/home');
                    },
                    failure: (message, info, draft, _) {
                      if (info == null) {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(SnackBar(content: Text(message)));
                        return;
                      }

                      if (!info.isEditable) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (!context.mounted) return;
                          showEditBlockedDialog(context, message: message);
                          context.pop();
                        });
                        return;
                      }

                      if (draft != null) {
                        _syncFromDraft(draft);
                      }
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(content: Text(message)));
                    },
                  );
                },
                builder: (context, state) {
                  return state.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    editing: (info, draft, _, isDirty, _) =>
                        _buildForm(context, draft, isSaving: false),
                    saving: (info, draft, _) =>
                        _buildForm(context, draft, isSaving: true),
                    cancelling: (info, draft, _) =>
                        _buildForm(context, draft, isCancelling: true),
                    saveSuccess: () => const SizedBox.shrink(),
                    cancelSuccess: () => const SizedBox.shrink(),
                    failure: (message, info, draft, _) {
                      if (info != null && draft != null && info.isEditable) {
                        return _buildForm(context, draft, isSaving: false);
                      }
                      return _FailureView(
                        message: message,
                        onRetry: () => context.read<EditServiceRequestBloc>().add(
                          EditServiceRequestEvent.started(
                            serviceRequestId: widget.serviceRequestId,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildForm(
    BuildContext context,
    EditServiceRequestDraft draft, {
    bool isSaving = false,
    bool isCancelling = false,
  }) {
    final isBusy = isSaving || isCancelling;

    return Column(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const CreateServiceRequestSectionHeader(
                      icon: Icons.edit_note_outlined,
                      title: 'Información del pedido',
                      subtitle:
                          'Actualizá los datos para que los profesionales vean la información correcta.',
                    ),
                    const SizedBox(height: 24),
                    CreateServiceRequestLabeledField(
                      controller: _titleController,
                      label: 'Título',
                      hintText: 'Ej. Reparar pérdida de agua en baño',
                      helperText: 'Sé claro y específico con el título de tu pedido.',
                      maxLength: 200,
                      prefixIcon: Icon(
                        Icons.title,
                        color: context.colors.onSurfaceVariant,
                      ),
                      validator: (value) =>
                          validateServiceRequestTitle(value)?.message,
                      onChanged: (_) => _notifyFieldChanges(context),
                    ),
                    const SizedBox(height: 20),
                    CreateServiceRequestLabeledField(
                      controller: _descriptionController,
                      label: 'Descripción',
                      hintText:
                          'Describe detalladamente el trabajo que necesitas.',
                      helperText:
                          'Mientras más detalles brindes, mejores propuestas recibirás.',
                      maxLength: 2000,
                      minLines: 4,
                      maxLines: 8,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(bottom: 72),
                        child: Icon(
                          Icons.description_outlined,
                          color: context.colors.onSurfaceVariant,
                        ),
                      ),
                      validator: (value) =>
                          validateServiceRequestDescription(value)?.message,
                      onChanged: (_) => _notifyFieldChanges(context),
                    ),
                    const SizedBox(height: 24),
                    const CreateServiceRequestSectionHeader(
                      icon: Icons.location_on_outlined,
                      title: 'Ubicación y presupuesto',
                      subtitle:
                          'Esta información ayuda a los profesionales a evaluar tu pedido.',
                    ),
                    const SizedBox(height: 24),
                    CreateServiceRequestLabeledField(
                      controller: _locationController,
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
                      onChanged: (_) => _notifyFieldChanges(context),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Presupuesto *',
                      style: context.text.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: context.colors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 12),
                    CreateServiceRequestBudgetOptionCard(
                      icon: Icons.account_balance_wallet_outlined,
                      title: 'Tengo un presupuesto estimado',
                      description:
                          'Ingresa el monto aproximado que tienes en mente para este trabajo.',
                      isSelected:
                          _budgetMode == CreateServiceRequestBudgetMode.estimated,
                      onTap: () {
                        setState(
                          () => _budgetMode =
                              CreateServiceRequestBudgetMode.estimated,
                        );
                        _notifyBudgetModeChanged(context);
                      },
                      child: _budgetMode == CreateServiceRequestBudgetMode.estimated
                          ? TextFormField(
                              controller: _priceController,
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
                              onChanged: (_) => _notifyBudgetModeChanged(context),
                            )
                          : null,
                    ),
                    const SizedBox(height: 12),
                    CreateServiceRequestBudgetOptionCard(
                      icon: Icons.handshake_outlined,
                      title: 'Prefiero acordarlo con el profesional',
                      description:
                          'Aún no tengo un presupuesto definido y quiero recibir propuestas.',
                      isSelected:
                          _budgetMode == CreateServiceRequestBudgetMode.toBeAgreed,
                      onTap: () {
                        setState(
                          () => _budgetMode =
                              CreateServiceRequestBudgetMode.toBeAgreed,
                        );
                        _notifyBudgetModeChanged(context);
                      },
                    ),
                    const SizedBox(height: 24),
                    EditServiceRequestPhotoSection(
                      existingPhotos: draft.existingPhotos,
                      deletedPhotoIds: draft.deletedPhotoIds,
                      newPhotos: draft.newPhotos,
                      onPhotosChanged: (deletedPhotoIds, newPhotos) {
                        context.read<EditServiceRequestBloc>().add(
                          EditServiceRequestEvent.photosChanged(
                            deletedPhotoIds: deletedPhotoIds,
                            newPhotos: newPhotos,
                          ),
                        );
                      },
                      onError: (message) {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(SnackBar(content: Text(message)));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          color: context.colors.surface,
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
          child: SafeArea(
            top: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FilledButton(
                  onPressed: isBusy ? null : () => _onSave(context),
                  child: isSaving
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Guardar cambios'),
                ),
                const SizedBox(height: 12),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: context.colors.error,
                    side: BorderSide(color: context.colors.error),
                  ),
                  onPressed: isBusy ? null : () => _onCancelOrder(context),
                  child: isCancelling
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Cancelar pedido'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _FailureView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _FailureView({
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: context.appColors.error,
            ),
            const SizedBox(height: 16),
            Text(
              'No pudimos cargar el pedido',
              style: context.text.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: context.text.bodyMedium?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: onRetry,
              child: const Text('Reintentar'),
            ),
          ],
        ),
      ),
    );
  }
}
