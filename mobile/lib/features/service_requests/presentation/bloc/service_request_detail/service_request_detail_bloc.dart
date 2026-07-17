import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/service_requests/domain/usecases/get_service_request_info_usecase.dart';
import 'package:mobile/features/service_requests/presentation/bloc/service_request_detail/service_request_detail_event.dart';
import 'package:mobile/features/service_requests/presentation/bloc/service_request_detail/service_request_detail_state.dart';

class ServiceRequestDetailBloc
    extends Bloc<ServiceRequestDetailEvent, ServiceRequestDetailState> {
  final GetServiceRequestInfoUseCase getServiceRequestInfoUseCase;

  String? _serviceRequestId;

  ServiceRequestDetailBloc({required this.getServiceRequestInfoUseCase})
    : super(const ServiceRequestDetailState.initial()) {
    on<ServiceRequestDetailRequested>(_onRequested);
    on<ServiceRequestDetailRefreshRequested>(_onRefreshRequested);
  }

  Future<void> _onRequested(
    ServiceRequestDetailRequested event,
    Emitter<ServiceRequestDetailState> emit,
  ) async {
    _serviceRequestId = event.serviceRequestId;
    emit(const ServiceRequestDetailState.loading());

    final result = await getServiceRequestInfoUseCase(event.serviceRequestId);

    result.fold(
      (failure) => emit(
        ServiceRequestDetailState.failure(message: failure.message),
      ),
      (info) => emit(ServiceRequestDetailState.loaded(info: info)),
    );
  }

  Future<void> _onRefreshRequested(
    ServiceRequestDetailRefreshRequested event,
    Emitter<ServiceRequestDetailState> emit,
  ) async {
    final serviceRequestId = _serviceRequestId;
    if (serviceRequestId == null) return;

    emit(const ServiceRequestDetailState.loading());

    final result = await getServiceRequestInfoUseCase(serviceRequestId);

    result.fold(
      (failure) => emit(
        ServiceRequestDetailState.failure(message: failure.message),
      ),
      (info) => emit(ServiceRequestDetailState.loaded(info: info)),
    );
  }
}
