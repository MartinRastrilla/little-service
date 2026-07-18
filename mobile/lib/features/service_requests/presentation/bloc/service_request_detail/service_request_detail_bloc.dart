import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/service_requests/domain/usecases/get_service_request_activity_usecase.dart';
import 'package:mobile/features/service_requests/domain/usecases/get_service_request_info_usecase.dart';
import 'package:mobile/features/service_requests/presentation/bloc/service_request_detail/activity_load_status.dart';
import 'package:mobile/features/service_requests/presentation/bloc/service_request_detail/service_request_detail_event.dart';
import 'package:mobile/features/service_requests/presentation/bloc/service_request_detail/service_request_detail_state.dart';

class ServiceRequestDetailBloc
    extends Bloc<ServiceRequestDetailEvent, ServiceRequestDetailState> {
  final GetServiceRequestInfoUseCase getServiceRequestInfoUseCase;
  final GetServiceRequestActivityUseCase getServiceRequestActivityUseCase;

  String? _serviceRequestId;

  ServiceRequestDetailBloc({
    required this.getServiceRequestInfoUseCase,
    required this.getServiceRequestActivityUseCase,
  }) : super(const ServiceRequestDetailState.initial()) {
    on<ServiceRequestDetailRequested>(_onRequested);
    on<ServiceRequestDetailRefreshRequested>(_onRefreshRequested);
    on<ServiceRequestDetailActivityRequested>(_onActivityRequested);
    on<ServiceRequestDetailActivityRefreshRequested>(_onActivityRefreshRequested);
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
      (info) => emit(
        ServiceRequestDetailState.loaded(
          info: info,
          activityStatus: ActivityLoadStatus.initial,
        ),
      ),
    );
  }

  Future<void> _onRefreshRequested(
    ServiceRequestDetailRefreshRequested event,
    Emitter<ServiceRequestDetailState> emit,
  ) async {
    final serviceRequestId = _serviceRequestId;
    if (serviceRequestId == null) return;

    final currentState = state;
    final cachedActivity = currentState is ServiceRequestDetailLoaded
        ? currentState.activity
        : null;
    final cachedActivityStatus = currentState is ServiceRequestDetailLoaded
        ? currentState.activityStatus
        : ActivityLoadStatus.initial;

    emit(const ServiceRequestDetailState.loading());

    final result = await getServiceRequestInfoUseCase(serviceRequestId);

    result.fold(
      (failure) => emit(
        ServiceRequestDetailState.failure(message: failure.message),
      ),
      (info) => emit(
        ServiceRequestDetailState.loaded(
          info: info,
          activity: cachedActivity,
          activityStatus: cachedActivityStatus,
        ),
      ),
    );
  }

  Future<void> _onActivityRequested(
    ServiceRequestDetailActivityRequested event,
    Emitter<ServiceRequestDetailState> emit,
  ) async {
    await _fetchActivity(emit, force: false);
  }

  Future<void> _onActivityRefreshRequested(
    ServiceRequestDetailActivityRefreshRequested event,
    Emitter<ServiceRequestDetailState> emit,
  ) async {
    await _fetchActivity(emit, force: true);
  }

  Future<void> _fetchActivity(
    Emitter<ServiceRequestDetailState> emit, {
    required bool force,
  }) async {
    final currentState = state;
    if (currentState is! ServiceRequestDetailLoaded) return;

    if (!force &&
        currentState.activityStatus == ActivityLoadStatus.loaded &&
        currentState.activity != null) {
      return;
    }

    final serviceRequestId = _serviceRequestId;
    if (serviceRequestId == null) return;

    emit(
      currentState.copyWith(
        activityStatus: ActivityLoadStatus.loading,
        activityErrorMessage: null,
      ),
    );

    final result = await getServiceRequestActivityUseCase(serviceRequestId);

    result.fold(
      (failure) => emit(
        currentState.copyWith(
          activityStatus: ActivityLoadStatus.failure,
          activityErrorMessage: failure.message,
        ),
      ),
      (activity) => emit(
        currentState.copyWith(
          activity: activity,
          activityStatus: ActivityLoadStatus.loaded,
          activityErrorMessage: null,
        ),
      ),
    );
  }
}
