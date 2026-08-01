import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/service_requests/domain/entities/edit_service_request_draft.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_info.dart';

part 'edit_service_request_state.freezed.dart';

@freezed
sealed class EditServiceRequestState with _$EditServiceRequestState {
  const factory EditServiceRequestState.initial() = EditServiceRequestInitial;

  const factory EditServiceRequestState.loading() = EditServiceRequestLoading;

  const factory EditServiceRequestState.editing({
    required ServiceRequestInfo info,
    required EditServiceRequestDraft draft,
    required EditServiceRequestDraft initialDraft,
    required bool isDirty,
    String? fieldError,
  }) = EditServiceRequestEditing;

  const factory EditServiceRequestState.saving({
    required ServiceRequestInfo info,
    required EditServiceRequestDraft draft,
    required EditServiceRequestDraft initialDraft,
  }) = EditServiceRequestSaving;

  const factory EditServiceRequestState.cancelling({
    required ServiceRequestInfo info,
    required EditServiceRequestDraft draft,
    required EditServiceRequestDraft initialDraft,
  }) = EditServiceRequestCancelling;

  const factory EditServiceRequestState.saveSuccess() =
      EditServiceRequestSaveSuccess;

  const factory EditServiceRequestState.cancelSuccess() =
      EditServiceRequestCancelSuccess;

  const factory EditServiceRequestState.failure({
    required String message,
    ServiceRequestInfo? info,
    EditServiceRequestDraft? draft,
    EditServiceRequestDraft? initialDraft,
  }) = EditServiceRequestFailure;
}
