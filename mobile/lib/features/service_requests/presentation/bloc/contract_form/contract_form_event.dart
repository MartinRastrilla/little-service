import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_form_event.freezed.dart';

@freezed
sealed class ContractFormEvent with _$ContractFormEvent {
  const factory ContractFormEvent.started({
    required String serviceRequestId,
    double? suggestedAmount,
    @Default(false) bool allowCreate,
  }) = ContractFormStarted;

  const factory ContractFormEvent.saveRequested({
    required String terms,
    required DateTime startDate,
    required DateTime endDate,
    required double amount,
  }) = ContractFormSaveRequested;
}
