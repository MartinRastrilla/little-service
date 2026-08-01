import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/freelancer_public_profile/domain/entities/freelancer_public_profile.dart';
import 'package:mobile/features/freelancer_public_profile/domain/usecases/get_public_freelancer_profile_usecase.dart';
import 'package:mobile/features/service_requests/domain/usecases/cancel_service_request_engagement_usecase.dart';
import 'package:mobile/features/service_requests/domain/usecases/get_service_request_activity_usecase.dart';
import 'package:mobile/features/service_requests/domain/usecases/get_service_request_info_usecase.dart';
import 'package:mobile/features/service_requests/domain/usecases/get_service_request_professional_usecase.dart';
import 'package:mobile/features/service_requests/presentation/bloc/service_request_detail/activity_load_status.dart';
import 'package:mobile/features/service_requests/presentation/bloc/service_request_detail/service_request_detail_event.dart';
import 'package:mobile/features/service_requests/presentation/bloc/service_request_detail/service_request_detail_state.dart';
import 'package:mobile/features/service_requests/presentation/mappers/professional_tab_error_mapper.dart';

class ServiceRequestDetailBloc
    extends Bloc<ServiceRequestDetailEvent, ServiceRequestDetailState> {
  final GetServiceRequestInfoUseCase getServiceRequestInfoUseCase;
  final GetServiceRequestActivityUseCase getServiceRequestActivityUseCase;
  final GetServiceRequestProfessionalUseCase getServiceRequestProfessionalUseCase;
  final GetPublicFreelancerProfileUseCase getPublicFreelancerProfileUseCase;
  final CancelServiceRequestEngagementUseCase cancelServiceRequestEngagementUseCase;

  String? _serviceRequestId;

  ServiceRequestDetailBloc({
    required this.getServiceRequestInfoUseCase,
    required this.getServiceRequestActivityUseCase,
    required this.getServiceRequestProfessionalUseCase,
    required this.getPublicFreelancerProfileUseCase,
    required this.cancelServiceRequestEngagementUseCase,
  }) : super(const ServiceRequestDetailState.initial()) {
    on<ServiceRequestDetailRequested>(_onRequested);
    on<ServiceRequestDetailRefreshRequested>(_onRefreshRequested);
    on<ServiceRequestDetailActivityRequested>(_onActivityRequested);
    on<ServiceRequestDetailActivityRefreshRequested>(_onActivityRefreshRequested);
    on<ServiceRequestDetailProfessionalRequested>(_onProfessionalRequested);
    on<ServiceRequestDetailProfessionalRefreshRequested>(
      _onProfessionalRefreshRequested,
    );
    on<ServiceRequestDetailRevokeEngagementRequested>(_onRevokeEngagementRequested);
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
          professionalStatus: ActivityLoadStatus.initial,
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
    final cachedProfessional = currentState is ServiceRequestDetailLoaded
        ? currentState.professional
        : null;
    final cachedFreelancerProfile = currentState is ServiceRequestDetailLoaded
        ? currentState.freelancerProfile
        : null;
    final cachedProfessionalStatus = currentState is ServiceRequestDetailLoaded
        ? currentState.professionalStatus
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
          professional: cachedProfessional,
          freelancerProfile: cachedFreelancerProfile,
          professionalStatus: cachedProfessionalStatus,
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

  Future<void> _onProfessionalRequested(
    ServiceRequestDetailProfessionalRequested event,
    Emitter<ServiceRequestDetailState> emit,
  ) async {
    await _fetchProfessional(emit, force: false);
  }

  Future<void> _onProfessionalRefreshRequested(
    ServiceRequestDetailProfessionalRefreshRequested event,
    Emitter<ServiceRequestDetailState> emit,
  ) async {
    await _fetchProfessional(emit, force: true);
  }

  Future<void> _onRevokeEngagementRequested(
    ServiceRequestDetailRevokeEngagementRequested event,
    Emitter<ServiceRequestDetailState> emit,
  ) async {
    final currentState = state;
    if (currentState is! ServiceRequestDetailLoaded) return;

    final serviceRequestId = _serviceRequestId;
    if (serviceRequestId == null) return;

    emit(currentState.copyWith(isRevokingEngagement: true));

    final result = await cancelServiceRequestEngagementUseCase(serviceRequestId);

    await result.fold(
      (failure) async {
        emit(
          currentState.copyWith(
            isRevokingEngagement: false,
            professionalErrorMessage: mapProfessionalTabErrorMessage(failure),
          ),
        );
      },
      (professional) async {
        emit(
          currentState.copyWith(
            professional: professional,
            freelancerProfile: null,
            professionalStatus: ActivityLoadStatus.loaded,
            professionalErrorMessage: null,
            isRevokingEngagement: false,
          ),
        );

        final infoResult = await getServiceRequestInfoUseCase(serviceRequestId);
        infoResult.fold(
          (_) {},
          (info) {
            if (state is ServiceRequestDetailLoaded) {
              emit(
                (state as ServiceRequestDetailLoaded).copyWith(info: info),
              );
            }
          },
        );
      },
    );
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

  Future<void> _fetchProfessional(
    Emitter<ServiceRequestDetailState> emit, {
    required bool force,
  }) async {
    final currentState = state;
    if (currentState is! ServiceRequestDetailLoaded) return;

    if (!force &&
        currentState.professionalStatus == ActivityLoadStatus.loaded &&
        currentState.professional != null) {
      return;
    }

    final serviceRequestId = _serviceRequestId;
    if (serviceRequestId == null) return;

    emit(
      currentState.copyWith(
        professionalStatus: ActivityLoadStatus.loading,
        professionalErrorMessage: null,
        freelancerProfile: force ? null : currentState.freelancerProfile,
      ),
    );

    final result = await getServiceRequestProfessionalUseCase(serviceRequestId);

    await result.fold(
      (failure) async {
        emit(
          currentState.copyWith(
            professionalStatus: ActivityLoadStatus.failure,
            professionalErrorMessage: failure.message,
          ),
        );
      },
      (professional) async {
        FreelancerPublicProfile? profile;
        if (professional.hasAssignedProfessional &&
            professional.freelancerId != null) {
          final profileResult = await getPublicFreelancerProfileUseCase(
            professional.freelancerId!,
          );
          profileResult.fold((_) => profile = null, (value) => profile = value);
        }

        emit(
          currentState.copyWith(
            professional: professional,
            freelancerProfile: profile,
            professionalStatus: ActivityLoadStatus.loaded,
            professionalErrorMessage: null,
          ),
        );
      },
    );
  }
}
