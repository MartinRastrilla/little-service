import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/freelancer_my_work/domain/entities/freelancer_work_item.dart';
import 'package:mobile/features/freelancer_my_work/domain/usecases/get_freelancer_applications_usecase.dart';
import 'package:mobile/features/freelancer_my_work/domain/usecases/get_freelancer_jobs_usecase.dart';
import 'package:mobile/features/freelancer_my_work/presentation/bloc/freelancer_my_work_event.dart';
import 'package:mobile/features/freelancer_my_work/presentation/bloc/freelancer_my_work_state.dart';

class FreelancerMyWorkBloc
    extends Bloc<FreelancerMyWorkEvent, FreelancerMyWorkState> {
  final GetFreelancerApplicationsUseCase getFreelancerApplicationsUseCase;
  final GetFreelancerJobsUseCase getFreelancerJobsUseCase;

  FreelancerMyWorkTab _tab = FreelancerMyWorkTab.applications;
  FreelancerApplicationFilter _applicationFilter =
      FreelancerApplicationFilter.all;
  FreelancerJobFilter _jobFilter = FreelancerJobFilter.all;
  List<FreelancerWorkItem> _applications = [];
  List<FreelancerWorkItem> _jobs = [];

  FreelancerMyWorkBloc({
    required this.getFreelancerApplicationsUseCase,
    required this.getFreelancerJobsUseCase,
  }) : super(const FreelancerMyWorkState.initial()) {
    on<FreelancerMyWorkStarted>(_onStarted);
    on<FreelancerMyWorkTabChanged>(_onTabChanged);
    on<FreelancerMyWorkApplicationFilterChanged>(_onApplicationFilterChanged);
    on<FreelancerMyWorkJobFilterChanged>(_onJobFilterChanged);
    on<FreelancerMyWorkRetry>(_onRetry);
  }

  Future<void> _onStarted(
    FreelancerMyWorkStarted event,
    Emitter<FreelancerMyWorkState> emit,
  ) async {
    if (event.initialTab != null) {
      _tab = event.initialTab!;
    }
    await _loadCurrentTab(emit);
  }

  Future<void> _onTabChanged(
    FreelancerMyWorkTabChanged event,
    Emitter<FreelancerMyWorkState> emit,
  ) async {
    _tab = event.tab;
    await _loadCurrentTab(emit);
  }

  Future<void> _onApplicationFilterChanged(
    FreelancerMyWorkApplicationFilterChanged event,
    Emitter<FreelancerMyWorkState> emit,
  ) async {
    _applicationFilter = event.filter;
    await _loadCurrentTab(emit);
  }

  Future<void> _onJobFilterChanged(
    FreelancerMyWorkJobFilterChanged event,
    Emitter<FreelancerMyWorkState> emit,
  ) async {
    _jobFilter = event.filter;
    await _loadCurrentTab(emit);
  }

  Future<void> _onRetry(
    FreelancerMyWorkRetry event,
    Emitter<FreelancerMyWorkState> emit,
  ) async {
    await _loadCurrentTab(emit);
  }

  Future<void> _loadCurrentTab(Emitter<FreelancerMyWorkState> emit) async {
    emit(
      FreelancerMyWorkState.loading(
        tab: _tab,
        applicationFilter: _applicationFilter,
        jobFilter: _jobFilter,
      ),
    );

    if (_tab == FreelancerMyWorkTab.applications) {
      final result = await getFreelancerApplicationsUseCase(
        GetFreelancerApplicationsParams(filter: _applicationFilter),
      );

      result.fold(
        (failure) => emit(
          FreelancerMyWorkState.failure(
            tab: _tab,
            applicationFilter: _applicationFilter,
            jobFilter: _jobFilter,
            message: failure.message,
          ),
        ),
        (items) {
          _applications = items;
          _emitLoadedOrEmpty(emit);
        },
      );
      return;
    }

    final result = await getFreelancerJobsUseCase(
      GetFreelancerJobsParams(filter: _jobFilter),
    );

    result.fold(
      (failure) => emit(
        FreelancerMyWorkState.failure(
          tab: _tab,
          applicationFilter: _applicationFilter,
          jobFilter: _jobFilter,
          message: failure.message,
        ),
      ),
      (items) {
        _jobs = items;
        _emitLoadedOrEmpty(emit);
      },
    );
  }

  void _emitLoadedOrEmpty(Emitter<FreelancerMyWorkState> emit) {
    final currentItems =
        _tab == FreelancerMyWorkTab.applications ? _applications : _jobs;

    if (currentItems.isEmpty) {
      emit(
        FreelancerMyWorkState.empty(
          tab: _tab,
          applicationFilter: _applicationFilter,
          jobFilter: _jobFilter,
        ),
      );
      return;
    }

    emit(
      FreelancerMyWorkState.loaded(
        tab: _tab,
        applicationFilter: _applicationFilter,
        jobFilter: _jobFilter,
        applications: _applications,
        jobs: _jobs,
      ),
    );
  }
}
