import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_contract.dart';
import 'package:mobile/features/service_requests/domain/usecases/create_contract_usecase.dart';
import 'package:mobile/features/service_requests/domain/usecases/get_contract_usecase.dart';
import 'package:mobile/features/service_requests/domain/usecases/update_contract_usecase.dart';
import 'package:mobile/features/service_requests/presentation/bloc/contract_form/contract_form_event.dart';
import 'package:mobile/features/service_requests/presentation/bloc/contract_form/contract_form_state.dart';
import 'package:mobile/features/service_requests/presentation/validators/contract_validators.dart';

class ContractFormBloc extends Bloc<ContractFormEvent, ContractFormState> {
  final GetContractUseCase getContractUseCase;
  final CreateContractUseCase createContractUseCase;
  final UpdateContractUseCase updateContractUseCase;

  String? _serviceRequestId;
  double? _suggestedAmount;

  ContractFormBloc({
    required this.getContractUseCase,
    required this.createContractUseCase,
    required this.updateContractUseCase,
  }) : super(const ContractFormState.initial()) {
    on<ContractFormStarted>(_onStarted);
    on<ContractFormSaveRequested>(_onSaveRequested);
  }

  Future<void> _onStarted(
    ContractFormStarted event,
    Emitter<ContractFormState> emit,
  ) async {
    _serviceRequestId = event.serviceRequestId;
    _suggestedAmount = event.suggestedAmount;
    emit(const ContractFormState.loading());

    final result = await getContractUseCase(event.serviceRequestId);

    result.fold(
      (failure) {
        if (failure.code == 'CONTRACT_NOT_FOUND') {
          emit(
            ContractFormState.ready(
              suggestedAmount: event.suggestedAmount,
              canCreate: event.allowCreate,
              canEdit: false,
            ),
          );
          return;
        }

        emit(ContractFormState.failure(message: failure.message));
      },
      (contract) {
        emit(
          ContractFormState.ready(
            contract: contract,
            suggestedAmount: contract.suggestedAmount ?? event.suggestedAmount,
            canCreate: false,
            canEdit: contract.canEdit,
          ),
        );
      },
    );
  }

  Future<void> _onSaveRequested(
    ContractFormSaveRequested event,
    Emitter<ContractFormState> emit,
  ) async {
    final current = state;
    if (current is! ContractFormReady) return;
    if (!current.canCreate && !current.canEdit) return;

    final serviceRequestId = _serviceRequestId;
    if (serviceRequestId == null) return;

    final termsError = validateContractTerms(event.terms);
    if (termsError != null) {
      emit(current.copyWith(errorMessage: termsError.message, isSaving: false));
      return;
    }

    final amountError = validateContractAmount(event.amount);
    if (amountError != null) {
      emit(current.copyWith(errorMessage: amountError.message, isSaving: false));
      return;
    }

    final datesError = validateContractDates(event.startDate, event.endDate);
    if (datesError != null) {
      emit(current.copyWith(errorMessage: datesError.message, isSaving: false));
      return;
    }

    emit(current.copyWith(isSaving: true, errorMessage: null));

    final params = UpsertContractParams(
      serviceRequestId: serviceRequestId,
      terms: event.terms.trim(),
      startDate: event.startDate,
      endDate: event.endDate,
      amount: event.amount,
    );

    final result = current.contract == null
        ? await createContractUseCase(params)
        : await updateContractUseCase(params);

    result.fold(
      (failure) {
        emit(
          current.copyWith(
            isSaving: false,
            errorMessage: failure.message,
          ),
        );
      },
      (contract) {
        emit(
          ContractFormState.ready(
            contract: contract,
            suggestedAmount: contract.suggestedAmount ?? _suggestedAmount,
            canCreate: false,
            canEdit: contract.canEdit,
            isSaving: false,
          ),
        );
      },
    );
  }
}
