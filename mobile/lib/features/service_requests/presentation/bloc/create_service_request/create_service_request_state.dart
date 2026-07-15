import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/service_requests/domain/entities/create_service_request_draft.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_detail.dart';

part 'create_service_request_state.freezed.dart';

@freezed
sealed class CreateServiceRequestState with _$CreateServiceRequestState {
  const factory CreateServiceRequestState.initial() =
      CreateServiceRequestInitial;

  const factory CreateServiceRequestState.editing({
    required int currentStep,
    required CreateServiceRequestDraft draft,
    String? stepError,
  }) = CreateServiceRequestEditing;

  const factory CreateServiceRequestState.submitting({
    required CreateServiceRequestDraft draft,
  }) = CreateServiceRequestSubmitting;

  const factory CreateServiceRequestState.success({
    required ServiceRequestDetail detail,
  }) = CreateServiceRequestSuccess;

  const factory CreateServiceRequestState.failure({
    required String message,
    required int currentStep,
    required CreateServiceRequestDraft draft,
  }) = CreateServiceRequestFailure;
}
