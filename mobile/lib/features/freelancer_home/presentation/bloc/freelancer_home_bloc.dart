import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/freelancer_home/domain/entities/open_service_request_date_filter.dart';
import 'package:mobile/features/freelancer_home/domain/usecases/get_open_service_requests_usecase.dart';
import 'package:mobile/features/freelancer_home/presentation/bloc/freelancer_home_event.dart';
import 'package:mobile/features/freelancer_home/presentation/bloc/freelancer_home_state.dart';

class FreelancerHomeBloc extends Bloc<FreelancerHomeEvent, FreelancerHomeState> {
  final GetOpenServiceRequestsUseCase getOpenServiceRequestsUseCase;

  FreelancerHomeBloc({required this.getOpenServiceRequestsUseCase})
      : super(const FreelancerHomeState.initial()) {
    on<FreelancerHomeRequested>(_onRequested);
  }

  Future<void> _onRequested(
    FreelancerHomeRequested event,
    Emitter<FreelancerHomeState> emit,
  ) async {
    emit(const FreelancerHomeState.loading());

    final effectiveSearch = _effectiveSearch(event.search);
    final isFilteredOrSearched =
        event.filter != OpenServiceRequestDateFilter.all ||
        (effectiveSearch?.isNotEmpty ?? false);

    final result = await getOpenServiceRequestsUseCase(
      GetOpenServiceRequestsParams(
        filter: event.filter,
        search: effectiveSearch,
      ),
    );

    result.fold(
      (failure) => emit(FreelancerHomeState.failure(message: failure.message)),
      (requests) {
        if (requests.isEmpty) {
          emit(
            FreelancerHomeState.empty(
              currentFilter: event.filter,
              currentSearch: effectiveSearch,
              isFilteredOrSearched: isFilteredOrSearched,
            ),
          );
          return;
        }

        emit(
          FreelancerHomeState.loaded(
            requests: requests,
            currentFilter: event.filter,
            currentSearch: effectiveSearch,
            isFilteredOrSearched: isFilteredOrSearched,
          ),
        );
      },
    );
  }

  String? _effectiveSearch(String? search) {
    final trimmed = search?.trim();
    if (trimmed == null || trimmed.length < 2) return null;
    return trimmed;
  }
}
