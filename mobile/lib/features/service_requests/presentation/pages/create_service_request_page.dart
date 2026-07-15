import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/app/di.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/features/service_requests/domain/entities/create_service_request_draft.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_photo_input.dart';
import 'package:mobile/features/service_requests/presentation/bloc/create_service_request/create_service_request_bloc.dart';
import 'package:mobile/features/service_requests/presentation/bloc/create_service_request/create_service_request_event.dart';
import 'package:mobile/features/service_requests/presentation/bloc/create_service_request/create_service_request_state.dart';
import 'package:mobile/features/service_requests/presentation/widgets/create_service_request/create_service_request_footer.dart';
import 'package:mobile/features/service_requests/presentation/widgets/create_service_request/create_service_request_step_indicator.dart';
import 'package:mobile/features/service_requests/presentation/widgets/create_service_request/steps/create_service_request_step_one.dart';
import 'package:mobile/features/service_requests/presentation/widgets/create_service_request/steps/create_service_request_step_three.dart';
import 'package:mobile/features/service_requests/presentation/widgets/create_service_request/steps/create_service_request_step_two.dart';

class CreateServiceRequestPage extends StatefulWidget {
  const CreateServiceRequestPage({super.key});

  @override
  State<CreateServiceRequestPage> createState() =>
      _CreateServiceRequestPageState();
}

class _CreateServiceRequestPageState extends State<CreateServiceRequestPage> {
  final _formKeyStepOne = GlobalKey<FormState>();
  final _formKeyStepTwo = GlobalKey<FormState>();
  final _stepTwoKey = GlobalKey<CreateServiceRequestStepTwoState>();

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  final _priceController = TextEditingController();

  List<ServiceRequestPhotoInput> _photos = const [];
  int _lastSyncedStep = -1;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _syncControllersFromDraft(CreateServiceRequestDraft draft, int step) {
    if (_lastSyncedStep != step) {
      _lastSyncedStep = step;
      _titleController.text = draft.title;
      _descriptionController.text = draft.description;
      _locationController.text = draft.location;
      if (draft.price != null) {
        _priceController.text = draft.price!.toInt().toString();
      } else {
        _priceController.clear();
      }
    }

    if (draft.photos.isNotEmpty) {
      _photos = List<ServiceRequestPhotoInput>.from(draft.photos);
    }
  }

  CreateServiceRequestBudgetMode _budgetModeFromDraft(
    CreateServiceRequestDraft draft,
  ) {
    return draft.price != null
        ? CreateServiceRequestBudgetMode.estimated
        : CreateServiceRequestBudgetMode.toBeAgreed;
  }

  Future<void> _confirmAbandon(BuildContext context) async {
    final shouldLeave = await showDialog<bool>(
      context: context,
      builder:
          (dialogContext) => AlertDialog(
            title: const Text('¿Salir sin guardar?'),
            content: const Text(
              'Si sales ahora, perderás los datos ingresados en este pedido.',
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
      context.read<CreateServiceRequestBloc>().add(
        const CreateServiceRequestEvent.resetRequested(),
      );
      context.pop();
    }
  }

  void _onContinue(BuildContext context, int currentStep) {
    switch (currentStep) {
      case 0:
        if (!_formKeyStepOne.currentState!.validate()) return;
        context.read<CreateServiceRequestBloc>().add(
          CreateServiceRequestEvent.stepOneSubmitted(
            title: _titleController.text,
            description: _descriptionController.text,
          ),
        );
      case 1:
        _stepTwoKey.currentState?.submit(context);
      case 2:
        context.read<CreateServiceRequestBloc>().add(
          CreateServiceRequestEvent.stepThreeSubmitted(photos: _photos),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              sl<CreateServiceRequestBloc>()
                ..add(const CreateServiceRequestEvent.started()),
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
                automaticallyImplyLeading: false,
                centerTitle: true,
                title: Text(
                  'Nuevo pedido',
                  style: context.text.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => _confirmAbandon(context),
                  ),
                ],
              ),
              body: BlocConsumer<
                CreateServiceRequestBloc,
                CreateServiceRequestState
              >(
                listener: (context, state) {
                  final currentStep = state.maybeWhen(
                    editing: (step, _, _) => step,
                    submitting: (_) => 2,
                    failure: (_, step, _) => step,
                    orElse: () => 0,
                  );
                  final draft = state.maybeWhen(
                    editing: (_, draft, _) => draft,
                    submitting: (draft) => draft,
                    failure: (_, _, draft) => draft,
                    orElse: () => const CreateServiceRequestDraft(),
                  );
                  _syncControllersFromDraft(draft, currentStep);

                  state.maybeWhen(
                    success: (_) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          const SnackBar(content: Text('Pedido creado')),
                        );
                      context.pop(true);
                    },
                    failure: (message, _, _) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(content: Text(message)));
                    },
                    editing: (_, _, stepError) {
                      if (stepError != null) {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(SnackBar(content: Text(stepError)));
                      }
                    },
                    orElse: () {},
                  );
                },
                builder: (context, state) {
                  final isSubmitting = state is CreateServiceRequestSubmitting;

                  final currentStep = state.maybeWhen(
                    editing: (step, _, _) => step,
                    submitting: (_) => 2,
                    failure: (_, step, _) => step,
                    orElse: () => 0,
                  );

                  final draft = state.maybeWhen(
                    editing: (_, draft, _) => draft,
                    submitting: (draft) => draft,
                    failure: (_, _, draft) => draft,
                    orElse: () => const CreateServiceRequestDraft(),
                  );

                  final stepError = state.maybeWhen(
                    editing: (_, _, error) => error,
                    orElse: () => null,
                  );

                  return Column(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => FocusScope.of(context).unfocus(),
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                CreateServiceRequestStepIndicator(
                                  currentStep: currentStep,
                                ),
                                const SizedBox(height: 24),
                                if (currentStep == 0)
                                  CreateServiceRequestStepOne(
                                    formKey: _formKeyStepOne,
                                    titleController: _titleController,
                                    descriptionController:
                                        _descriptionController,
                                    stepError: stepError,
                                  )
                                else if (currentStep == 1)
                                  CreateServiceRequestStepTwo(
                                    key: _stepTwoKey,
                                    formKey: _formKeyStepTwo,
                                    locationController: _locationController,
                                    priceController: _priceController,
                                    initialBudgetMode: _budgetModeFromDraft(
                                      draft,
                                    ),
                                    stepError: stepError,
                                  )
                                else
                                  CreateServiceRequestStepThree(
                                    draft: draft,
                                    photos: _photos,
                                    onPhotosChanged: (photos) {
                                      setState(() => _photos = photos);
                                    },
                                    stepError: stepError,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      CreateServiceRequestFooter(
                        currentStep: currentStep,
                        isLoading: isSubmitting,
                        onBack:
                            () => context.read<CreateServiceRequestBloc>().add(
                              const CreateServiceRequestEvent.backRequested(),
                            ),
                        onContinue:
                            isSubmitting
                                ? null
                                : () => _onContinue(context, currentStep),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
