import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_contract.dart';

part 'contract_form_state.freezed.dart';

@freezed
sealed class ContractFormState with _$ContractFormState {
  const factory ContractFormState.initial() = ContractFormInitial;

  const factory ContractFormState.loading() = ContractFormLoading;

  const factory ContractFormState.ready({
    ServiceRequestContract? contract,
    double? suggestedAmount,
    required bool canCreate,
    required bool canEdit,
    @Default(false) bool isSaving,
    @Default(false) bool shouldPop,
    String? errorMessage,
  }) = ContractFormReady;

  const factory ContractFormState.failure({
    required String message,
  }) = ContractFormFailure;
}
