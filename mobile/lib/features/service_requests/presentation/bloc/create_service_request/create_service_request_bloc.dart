import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/service_requests/domain/entities/create_service_request_draft.dart';
import 'package:mobile/features/service_requests/domain/entities/create_service_request_params.dart';
import 'package:mobile/features/service_requests/domain/usecases/create_service_request_usecase.dart';
import 'package:mobile/features/service_requests/presentation/bloc/create_service_request/create_service_request_event.dart';
import 'package:mobile/features/service_requests/presentation/bloc/create_service_request/create_service_request_state.dart';
import 'package:mobile/features/service_requests/presentation/validators/create_service_request_validators.dart';

class CreateServiceRequestBloc
    extends Bloc<CreateServiceRequestEvent, CreateServiceRequestState> {
  final CreateServiceRequestUseCase createServiceRequestUseCase;

  CreateServiceRequestBloc({required this.createServiceRequestUseCase})
    : super(const CreateServiceRequestState.initial()) {
    on<CreateServiceRequestStarted>(_onStarted);
    on<CreateServiceRequestStepOneSubmitted>(_onStepOneSubmitted);
    on<CreateServiceRequestStepTwoSubmitted>(_onStepTwoSubmitted);
    on<CreateServiceRequestStepThreeSubmitted>(_onStepThreeSubmitted);
    on<CreateServiceRequestBackRequested>(_onBackRequested);
    on<CreateServiceRequestResetRequested>(_onResetRequested);
  }

  void _onStarted(
    CreateServiceRequestStarted event,
    Emitter<CreateServiceRequestState> emit,
  ) {
    emit(
      const CreateServiceRequestState.editing(
        currentStep: 0,
        draft: CreateServiceRequestDraft(),
      ),
    );
  }

  void _onStepOneSubmitted(
    CreateServiceRequestStepOneSubmitted event,
    Emitter<CreateServiceRequestState> emit,
  ) {
    final titleError = validateServiceRequestTitle(event.title);
    if (titleError != null) {
      emit(
        CreateServiceRequestState.editing(
          currentStep: 0,
          draft: const CreateServiceRequestDraft(),
          stepError: titleError.message,
        ),
      );
      return;
    }

    final descriptionError = validateServiceRequestDescription(
      event.description,
    );
    if (descriptionError != null) {
      emit(
        CreateServiceRequestState.editing(
          currentStep: 0,
          draft: CreateServiceRequestDraft(title: event.title.trim()),
          stepError: descriptionError.message,
        ),
      );
      return;
    }

    emit(
      CreateServiceRequestState.editing(
        currentStep: 1,
        draft: CreateServiceRequestDraft(
          title: event.title.trim(),
          description: event.description.trim(),
        ),
      ),
    );
  }

  void _onStepTwoSubmitted(
    CreateServiceRequestStepTwoSubmitted event,
    Emitter<CreateServiceRequestState> emit,
  ) {
    final currentDraft = _currentDraft();

    final locationError = validateServiceRequestLocation(event.location);
    if (locationError != null) {
      emit(
        CreateServiceRequestState.editing(
          currentStep: 1,
          draft: currentDraft.copyWith(location: event.location.trim()),
          stepError: locationError.message,
        ),
      );
      return;
    }

    final priceError = validateServiceRequestPrice(event.price);
    if (priceError != null) {
      emit(
        CreateServiceRequestState.editing(
          currentStep: 1,
          draft: currentDraft.copyWith(
            location: event.location.trim(),
            price: event.price,
          ),
          stepError: priceError.message,
        ),
      );
      return;
    }

    emit(
      CreateServiceRequestState.editing(
        currentStep: 2,
        draft: currentDraft.copyWith(
          location: event.location.trim(),
          price: event.price,
          clearPrice: event.price == null,
        ),
      ),
    );
  }

  Future<void> _onStepThreeSubmitted(
    CreateServiceRequestStepThreeSubmitted event,
    Emitter<CreateServiceRequestState> emit,
  ) async {
    final currentDraft = _currentDraft();

    final photosError = validateServiceRequestPhotos(event.photos);
    if (photosError != null) {
      emit(
        CreateServiceRequestState.editing(
          currentStep: 2,
          draft: currentDraft.copyWith(photos: event.photos),
          stepError: photosError.message,
        ),
      );
      return;
    }

    final draft = currentDraft.copyWith(photos: event.photos);
    emit(CreateServiceRequestState.submitting(draft: draft));

    final result = await createServiceRequestUseCase(
      CreateServiceRequestParams(
        title: draft.title,
        description: draft.description,
        location: draft.location,
        price: draft.price,
        photos: draft.photos,
      ),
    );

    result.fold(
      (failure) => emit(
        CreateServiceRequestState.failure(
          message: failure.message,
          currentStep: 2,
          draft: draft,
        ),
      ),
      (detail) => emit(CreateServiceRequestState.success(detail: detail)),
    );
  }

  void _onBackRequested(
    CreateServiceRequestBackRequested event,
    Emitter<CreateServiceRequestState> emit,
  ) {
    final current = state;
    final int? currentStep;
    final CreateServiceRequestDraft? draft;

    if (current is CreateServiceRequestEditing) {
      currentStep = current.currentStep;
      draft = current.draft;
    } else if (current is CreateServiceRequestFailure) {
      currentStep = current.currentStep;
      draft = current.draft;
    } else {
      return;
    }

    if (currentStep == 0) {
      return;
    }

    emit(
      CreateServiceRequestState.editing(
        currentStep: currentStep - 1,
        draft: draft,
      ),
    );
  }

  void _onResetRequested(
    CreateServiceRequestResetRequested event,
    Emitter<CreateServiceRequestState> emit,
  ) {
    emit(const CreateServiceRequestState.initial());
  }

  CreateServiceRequestDraft _currentDraft() {
    return state.maybeWhen(
      editing: (_, draft, _) => draft,
      submitting: (draft) => draft,
      failure: (_, _, draft) => draft,
      orElse: () => const CreateServiceRequestDraft(),
    );
  }
}
