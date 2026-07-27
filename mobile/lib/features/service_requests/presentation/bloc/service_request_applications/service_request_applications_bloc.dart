import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_application.dart';
import 'package:mobile/features/service_requests/domain/usecases/accept_service_request_application_usecase.dart';
import 'package:mobile/features/service_requests/domain/usecases/get_service_request_applications_usecase.dart';
import 'package:mobile/features/service_requests/domain/usecases/reject_service_request_application_usecase.dart';
import 'package:mobile/features/service_requests/presentation/bloc/service_request_applications/service_request_applications_event.dart';
import 'package:mobile/features/service_requests/presentation/bloc/service_request_applications/service_request_applications_state.dart';

class ServiceRequestApplicationsBloc
    extends Bloc<ServiceRequestApplicationsEvent, ServiceRequestApplicationsState> {
  final GetServiceRequestApplicationsUseCase getServiceRequestApplicationsUseCase;
  final AcceptServiceRequestApplicationUseCase acceptServiceRequestApplicationUseCase;
  final RejectServiceRequestApplicationUseCase rejectServiceRequestApplicationUseCase;

  String? _serviceRequestId;
  ServiceRequestApplicationFilter _filter = ServiceRequestApplicationFilter.pending;
  List<ServiceRequestApplication> _allApplications = [];
  bool _canManageApplications = false;
  String _serviceRequestTitle = '';
  String _serviceRequestDisplayStatus = '';

  ServiceRequestApplicationsBloc({
    required this.getServiceRequestApplicationsUseCase,
    required this.acceptServiceRequestApplicationUseCase,
    required this.rejectServiceRequestApplicationUseCase,
  }) : super(const ServiceRequestApplicationsState.initial()) {
    on<ServiceRequestApplicationsStarted>(_onStarted);
    on<ServiceRequestApplicationsFilterChanged>(_onFilterChanged);
    on<ServiceRequestApplicationsRefreshRequested>(_onRefreshRequested);
    on<ServiceRequestApplicationsAcceptRequested>(_onAcceptRequested);
    on<ServiceRequestApplicationsRejectRequested>(_onRejectRequested);
  }

  Future<void> _onStarted(
    ServiceRequestApplicationsStarted event,
    Emitter<ServiceRequestApplicationsState> emit,
  ) async {
    _serviceRequestId = event.serviceRequestId;
    await _loadApplications(emit);
  }

  Future<void> _onFilterChanged(
    ServiceRequestApplicationsFilterChanged event,
    Emitter<ServiceRequestApplicationsState> emit,
  ) async {
    _filter = event.filter;
    _emitLoadedOrEmpty(emit);
  }

  Future<void> _onRefreshRequested(
    ServiceRequestApplicationsRefreshRequested event,
    Emitter<ServiceRequestApplicationsState> emit,
  ) async {
    await _loadApplications(emit);
  }

  Future<void> _onAcceptRequested(
    ServiceRequestApplicationsAcceptRequested event,
    Emitter<ServiceRequestApplicationsState> emit,
  ) async {
    final serviceRequestId = _serviceRequestId;
    if (serviceRequestId == null) return;

    final currentState = state;
    if (currentState is ServiceRequestApplicationsLoaded) {
      emit(
        currentState.copyWith(
          actionInProgressApplicationId: event.applicationId,
        ),
      );
    }

    final result = await acceptServiceRequestApplicationUseCase(
      AcceptServiceRequestApplicationParams(
        serviceRequestId: serviceRequestId,
        applicationId: event.applicationId,
      ),
    );

    result.fold(
      (failure) {
        if (currentState is ServiceRequestApplicationsLoaded) {
          emit(
            currentState.copyWith(actionInProgressApplicationId: null),
          );
        } else {
          emit(
            ServiceRequestApplicationsState.failure(
              message: failure.message,
              filter: _filter,
            ),
          );
        }
      },
      (_) => emit(
        const ServiceRequestApplicationsState.actionSuccess(accepted: true),
      ),
    );
  }

  Future<void> _onRejectRequested(
    ServiceRequestApplicationsRejectRequested event,
    Emitter<ServiceRequestApplicationsState> emit,
  ) async {
    final serviceRequestId = _serviceRequestId;
    if (serviceRequestId == null) return;

    final currentState = state;
    if (currentState is ServiceRequestApplicationsLoaded) {
      emit(
        currentState.copyWith(
          actionInProgressApplicationId: event.applicationId,
        ),
      );
    }

    final result = await rejectServiceRequestApplicationUseCase(
      RejectServiceRequestApplicationParams(
        serviceRequestId: serviceRequestId,
        applicationId: event.applicationId,
      ),
    );

    result.fold(
      (failure) {
        if (currentState is ServiceRequestApplicationsLoaded) {
          emit(
            currentState.copyWith(actionInProgressApplicationId: null),
          );
        } else {
          emit(
            ServiceRequestApplicationsState.failure(
              message: failure.message,
              filter: _filter,
            ),
          );
        }
      },
      (updatedApplication) async {
        _allApplications = _allApplications
            .map(
              (application) => application.id == updatedApplication.id
                  ? updatedApplication
                  : application,
            )
            .toList();
        _emitLoadedOrEmpty(emit);
      },
    );
  }

  Future<void> _loadApplications(
    Emitter<ServiceRequestApplicationsState> emit,
  ) async {
    final serviceRequestId = _serviceRequestId;
    if (serviceRequestId == null) return;

    emit(ServiceRequestApplicationsState.loading(filter: _filter));

    final result = await getServiceRequestApplicationsUseCase(serviceRequestId);

    result.fold(
      (failure) => emit(
        ServiceRequestApplicationsState.failure(
          message: failure.message,
          filter: _filter,
        ),
      ),
      (data) {
        _allApplications = data.applications;
        _canManageApplications = data.canManageApplications;
        _serviceRequestTitle = data.serviceRequestTitle;
        _serviceRequestDisplayStatus = data.serviceRequestDisplayStatus;
        _emitLoadedOrEmpty(emit);
      },
    );
  }

  void _emitLoadedOrEmpty(Emitter<ServiceRequestApplicationsState> emit) {
    final filtered = _filterApplications(_allApplications, _filter);

    if (filtered.isEmpty) {
      emit(
        ServiceRequestApplicationsState.empty(
          canManageApplications: _canManageApplications,
          serviceRequestTitle: _serviceRequestTitle,
          serviceRequestDisplayStatus: _serviceRequestDisplayStatus,
          filter: _filter,
        ),
      );
      return;
    }

    emit(
      ServiceRequestApplicationsState.loaded(
        applications: filtered,
        allApplications: _allApplications,
        canManageApplications: _canManageApplications,
        serviceRequestTitle: _serviceRequestTitle,
        serviceRequestDisplayStatus: _serviceRequestDisplayStatus,
        filter: _filter,
      ),
    );
  }

  List<ServiceRequestApplication> _filterApplications(
    List<ServiceRequestApplication> applications,
    ServiceRequestApplicationFilter filter,
  ) {
    return switch (filter) {
      ServiceRequestApplicationFilter.pending =>
        applications.where((application) => application.isPending).toList(),
      ServiceRequestApplicationFilter.all => applications,
    };
  }
}
