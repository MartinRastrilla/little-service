import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_info.dart';

part 'service_request_detail_state.freezed.dart';

@freezed
sealed class ServiceRequestDetailState with _$ServiceRequestDetailState {
  const factory ServiceRequestDetailState.initial() =
      ServiceRequestDetailInitial;

  const factory ServiceRequestDetailState.loading() =
      ServiceRequestDetailLoading;

  const factory ServiceRequestDetailState.loaded({
    required ServiceRequestInfo info,
  }) = ServiceRequestDetailLoaded;

  const factory ServiceRequestDetailState.failure({
    required String message,
  }) = ServiceRequestDetailFailure;
}
