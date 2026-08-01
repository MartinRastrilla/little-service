import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/service_requests/domain/entities/edit_service_request_draft.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_info.dart';
import 'package:mobile/features/service_requests/domain/entities/update_service_request_params.dart';
import 'package:mobile/features/service_requests/domain/usecases/cancel_service_request_usecase.dart';
import 'package:mobile/features/service_requests/domain/usecases/get_service_request_info_usecase.dart';
import 'package:mobile/features/service_requests/domain/usecases/update_service_request_usecase.dart';
import 'package:mobile/features/service_requests/presentation/bloc/edit_service_request/edit_service_request_event.dart';
import 'package:mobile/features/service_requests/presentation/bloc/edit_service_request/edit_service_request_state.dart';
import 'package:mobile/features/service_requests/presentation/mappers/edit_service_request_error_mapper.dart';
import 'package:mobile/features/service_requests/presentation/validators/create_service_request_validators.dart';

class EditServiceRequestBloc
    extends Bloc<EditServiceRequestEvent, EditServiceRequestState> {
  final GetServiceRequestInfoUseCase getServiceRequestInfoUseCase;
  final UpdateServiceRequestUseCase updateServiceRequestUseCase;
  final CancelServiceRequestUseCase cancelServiceRequestUseCase;

  String? _serviceRequestId;

  EditServiceRequestBloc({
    required this.getServiceRequestInfoUseCase,
    required this.updateServiceRequestUseCase,
    required this.cancelServiceRequestUseCase,
  }) : super(const EditServiceRequestState.initial()) {
    on<EditServiceRequestStarted>(_onStarted);
    on<EditServiceRequestFieldChanged>(_onFieldChanged);
    on<EditServiceRequestBudgetModeChanged>(_onBudgetModeChanged);
    on<EditServiceRequestPhotosChanged>(_onPhotosChanged);
    on<EditServiceRequestSaveRequested>(_onSaveRequested);
    on<EditServiceRequestCancelRequested>(_onCancelRequested);
  }

  Future<void> _onStarted(
    EditServiceRequestStarted event,
    Emitter<EditServiceRequestState> emit,
  ) async {
    _serviceRequestId = event.serviceRequestId;
    emit(const EditServiceRequestState.loading());

    final result = await getServiceRequestInfoUseCase(event.serviceRequestId);

    result.fold(
      (failure) => emit(
        EditServiceRequestState.failure(message: failure.message),
      ),
      (info) {
        if (!info.isEditable) {
          emit(
            EditServiceRequestState.failure(
              message: info.editBlockedReason ??
                  'Este pedido ya no se puede modificar',
              info: info,
            ),
          );
          return;
        }

        final draft = EditServiceRequestDraft.fromInfo(info);
        emit(
          EditServiceRequestState.editing(
            info: info,
            draft: draft,
            initialDraft: draft,
            isDirty: false,
          ),
        );
      },
    );
  }

  void _onFieldChanged(
    EditServiceRequestFieldChanged event,
    Emitter<EditServiceRequestState> emit,
  ) {
    final current = _currentEditingState();
    if (current == null) return;

    final updatedDraft = current.draft.copyWith(
      title: event.title,
      description: event.description,
      location: event.location,
    );

    _emitEditing(emit, current, updatedDraft);
  }

  void _onBudgetModeChanged(
    EditServiceRequestBudgetModeChanged event,
    Emitter<EditServiceRequestState> emit,
  ) {
    final current = _currentEditingState();
    if (current == null) return;

    final updatedDraft = current.draft.copyWith(
      priceMode: event.priceMode,
      price: event.price,
      clearPrice: event.priceMode == ServiceRequestPriceMode.toBeAgreed,
    );

    _emitEditing(emit, current, updatedDraft);
  }

  void _onPhotosChanged(
    EditServiceRequestPhotosChanged event,
    Emitter<EditServiceRequestState> emit,
  ) {
    final current = _currentEditingState();
    if (current == null) return;

    final updatedDraft = current.draft.copyWith(
      deletedPhotoIds: event.deletedPhotoIds,
      newPhotos: event.newPhotos,
    );

    _emitEditing(emit, current, updatedDraft);
  }

  Future<void> _onSaveRequested(
    EditServiceRequestSaveRequested event,
    Emitter<EditServiceRequestState> emit,
  ) async {
    final current = _currentEditingState();
    final serviceRequestId = _serviceRequestId;
    if (current == null || serviceRequestId == null) return;

    final titleError = validateServiceRequestTitle(event.title);
    if (titleError != null) {
      emit(current.copyWith(fieldError: titleError.message));
      return;
    }

    final descriptionError = validateServiceRequestDescription(event.description);
    if (descriptionError != null) {
      emit(current.copyWith(fieldError: descriptionError.message));
      return;
    }

    final locationError = validateServiceRequestLocation(event.location);
    if (locationError != null) {
      emit(current.copyWith(fieldError: locationError.message));
      return;
    }

    double? price;
    var clearPrice = false;
    if (event.priceMode == ServiceRequestPriceMode.estimated) {
      price = event.price;
      final priceError = validateServiceRequestPrice(price);
      if (priceError != null || price == null) {
        emit(
          current.copyWith(
            fieldError: priceError?.message ?? 'Ingresá un monto estimado válido',
          ),
        );
        return;
      }
    } else {
      clearPrice = true;
    }

    final photosError = validateServiceRequestPhotos(current.draft.newPhotos);
    if (photosError != null) {
      emit(current.copyWith(fieldError: photosError.message));
      return;
    }

    if (current.draft.totalPhotoCount > maxServiceRequestPhotos) {
      emit(
        current.copyWith(
          fieldError:
              'Se permiten como máximo $maxServiceRequestPhotos fotos',
        ),
      );
      return;
    }

    emit(
      EditServiceRequestState.saving(
        info: current.info,
        draft: current.draft,
        initialDraft: current.initialDraft,
      ),
    );

    final result = await updateServiceRequestUseCase(
      UpdateServiceRequestParams(
        serviceRequestId: serviceRequestId,
        title: event.title.trim(),
        description: event.description.trim(),
        location: event.location.trim(),
        price: price,
        clearPrice: clearPrice,
        deletedPhotoIds: current.draft.deletedPhotoIds,
        newPhotos: current.draft.newPhotos,
      ),
    );

    result.fold(
      (failure) => emit(
        EditServiceRequestState.editing(
          info: current.info,
          draft: current.draft,
          initialDraft: current.initialDraft,
          isDirty: !current.draft.isSameAs(current.initialDraft),
          fieldError: mapEditServiceRequestErrorMessage(failure),
        ),
      ),
      (_) => emit(const EditServiceRequestState.saveSuccess()),
    );
  }

  Future<void> _onCancelRequested(
    EditServiceRequestCancelRequested event,
    Emitter<EditServiceRequestState> emit,
  ) async {
    final current = _currentEditingState();
    final serviceRequestId = _serviceRequestId;
    if (current == null || serviceRequestId == null) return;

    if (!current.info.canCancel) {
      emit(
        current.copyWith(
          fieldError: current.info.cancelBlockedReason ??
              'Este pedido no se puede cancelar',
        ),
      );
      return;
    }

    emit(
      EditServiceRequestState.cancelling(
        info: current.info,
        draft: current.draft,
        initialDraft: current.initialDraft,
      ),
    );

    final result = await cancelServiceRequestUseCase(serviceRequestId);

    result.fold(
      (failure) => emit(
        EditServiceRequestState.editing(
          info: current.info,
          draft: current.draft,
          initialDraft: current.initialDraft,
          isDirty: !current.draft.isSameAs(current.initialDraft),
          fieldError: mapEditServiceRequestErrorMessage(failure),
        ),
      ),
      (_) => emit(const EditServiceRequestState.cancelSuccess()),
    );
  }

  EditServiceRequestEditing? _currentEditingState() {
    return state.mapOrNull(
      editing: (value) => value,
      saving: (value) => EditServiceRequestEditing(
        info: value.info,
        draft: value.draft,
        initialDraft: value.initialDraft,
        isDirty: !value.draft.isSameAs(value.initialDraft),
      ),
      cancelling: (value) => EditServiceRequestEditing(
        info: value.info,
        draft: value.draft,
        initialDraft: value.initialDraft,
        isDirty: !value.draft.isSameAs(value.initialDraft),
      ),
    );
  }

  void _emitEditing(
    Emitter<EditServiceRequestState> emit,
    EditServiceRequestEditing current,
    EditServiceRequestDraft updatedDraft,
  ) {
    emit(
      EditServiceRequestState.editing(
        info: current.info,
        draft: updatedDraft,
        initialDraft: current.initialDraft,
        isDirty: !updatedDraft.isSameAs(current.initialDraft),
        fieldError: null,
      ),
    );
  }
}
