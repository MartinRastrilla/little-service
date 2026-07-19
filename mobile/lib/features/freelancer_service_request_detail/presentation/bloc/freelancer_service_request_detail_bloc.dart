import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/freelancer_service_request_detail/domain/usecases/apply_to_open_service_request_usecase.dart';
import 'package:mobile/features/freelancer_service_request_detail/domain/usecases/get_open_service_request_detail_usecase.dart';
import 'package:mobile/features/freelancer_service_request_detail/presentation/bloc/freelancer_service_request_detail_event.dart';
import 'package:mobile/features/freelancer_service_request_detail/presentation/bloc/freelancer_service_request_detail_state.dart';
import 'package:mobile/features/freelancer_service_request_detail/presentation/mappers/apply_error_mapper.dart';

class FreelancerServiceRequestDetailBloc extends Bloc<
    FreelancerServiceRequestDetailEvent, FreelancerServiceRequestDetailState> {
  final GetOpenServiceRequestDetailUseCase getOpenServiceRequestDetailUseCase;
  final ApplyToOpenServiceRequestUseCase applyToOpenServiceRequestUseCase;

  FreelancerServiceRequestDetailBloc({
    required this.getOpenServiceRequestDetailUseCase,
    required this.applyToOpenServiceRequestUseCase,
  }) : super(const FreelancerServiceRequestDetailState.initial()) {
    on<FreelancerServiceRequestDetailRequested>(_onRequested);
    on<FreelancerServiceRequestDetailApplyConfirmed>(_onApplyConfirmed);
  }

  Future<void> _onRequested(
    FreelancerServiceRequestDetailRequested event,
    Emitter<FreelancerServiceRequestDetailState> emit,
  ) async {
    emit(const FreelancerServiceRequestDetailState.loading());

    final result = await getOpenServiceRequestDetailUseCase(event.serviceRequestId);

    result.fold(
      (failure) => emit(
        FreelancerServiceRequestDetailState.failure(
          message: failure.message,
        ),
      ),
      (detail) => emit(
        FreelancerServiceRequestDetailState.loaded(detail: detail),
      ),
    );
  }

  Future<void> _onApplyConfirmed(
    FreelancerServiceRequestDetailApplyConfirmed event,
    Emitter<FreelancerServiceRequestDetailState> emit,
  ) async {
    final detail = state.mapOrNull(
      loaded: (s) => s.detail,
      applying: (s) => s.detail,
      failure: (s) => s.detail,
    );
    if (detail == null) return;

    emit(FreelancerServiceRequestDetailState.applying(detail: detail));

    final result = await applyToOpenServiceRequestUseCase(event.serviceRequestId);

    result.fold(
      (failure) => emit(
        FreelancerServiceRequestDetailState.failure(
          message: mapApplyErrorMessage(failure),
          detail: detail,
        ),
      ),
      (_) => emit(const FreelancerServiceRequestDetailState.applySuccess()),
    );
  }
}
