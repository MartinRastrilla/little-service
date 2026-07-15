import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/service_requests/domain/entities/paged_service_requests_result.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_filter_option.dart';
import 'package:mobile/features/service_requests/domain/usecases/get_my_service_requests_usecase.dart';
import 'package:mobile/features/service_requests/presentation/bloc/my_service_requests_event.dart';
import 'package:mobile/features/service_requests/presentation/bloc/my_service_requests_state.dart';

class MyServiceRequestsBloc
    extends Bloc<MyServiceRequestsEvent, MyServiceRequestsState> {
  final GetMyServiceRequestsUseCase getMyServiceRequestsUseCase;

  MyServiceRequestsBloc({required this.getMyServiceRequestsUseCase})
    : super(const MyServiceRequestsState.initial()) {
    on<MyServiceRequestsRequested>(_onRequested);
    on<MyServiceRequestsLoadMore>(_onLoadMore);
  }

  Future<void> _onRequested(
    MyServiceRequestsRequested event,
    Emitter<MyServiceRequestsState> emit,
  ) async {
    emit(const MyServiceRequestsState.loading());

    final result = await getMyServiceRequestsUseCase(
      GetMyServiceRequestsParams(
        page: event.page,
        filter: event.filter,
        search: event.search,
      ),
    );

    result.fold(
      (failure) => emit(MyServiceRequestsState.failure(message: failure.message)),
      (paged) => _emitPagedResult(
        emit,
        paged: paged,
        filter: event.filter,
        search: event.search,
      ),
    );
  }

  Future<void> _onLoadMore(
    MyServiceRequestsLoadMore event,
    Emitter<MyServiceRequestsState> emit,
  ) async {
    final currentState = state;
    if (currentState is! MyServiceRequestsLoaded || !currentState.hasMore) {
      return;
    }

    emit(
      MyServiceRequestsState.loadingMore(
        requests: currentState.requests,
        currentFilter: currentState.currentFilter,
        currentSearch: currentState.currentSearch,
        totalCount: currentState.totalCount,
        hasMore: currentState.hasMore,
        currentPage: currentState.currentPage,
      ),
    );

    final result = await getMyServiceRequestsUseCase(
      GetMyServiceRequestsParams(
        page: currentState.currentPage + 1,
        filter: currentState.currentFilter,
        search: currentState.currentSearch,
      ),
    );

    result.fold(
      (failure) => emit(MyServiceRequestsState.failure(message: failure.message)),
      (paged) {
        final merged = [...currentState.requests, ...paged.items];
        final isFilteredOrSearched =
            currentState.currentFilter != ServiceRequestFilterOption.all ||
            (currentState.currentSearch?.trim().isNotEmpty ?? false);

        if (merged.isEmpty) {
          emit(
            MyServiceRequestsState.empty(
              currentFilter: currentState.currentFilter,
              currentSearch: currentState.currentSearch,
              isFilteredOrSearched: isFilteredOrSearched,
            ),
          );
          return;
        }

        emit(
          MyServiceRequestsState.loaded(
            requests: merged,
            currentFilter: currentState.currentFilter,
            currentSearch: currentState.currentSearch,
            totalCount: paged.totalCount,
            hasMore: paged.hasMore,
            currentPage: paged.page,
            isFilteredOrSearched: isFilteredOrSearched,
          ),
        );
      },
    );
  }

  void _emitPagedResult(
    Emitter<MyServiceRequestsState> emit, {
    required PagedServiceRequestsResult paged,
    required ServiceRequestFilterOption filter,
    String? search,
  }) {
    final isFilteredOrSearched =
        filter != ServiceRequestFilterOption.all ||
        (search?.trim().isNotEmpty ?? false);

    if (paged.items.isEmpty) {
      emit(
        MyServiceRequestsState.empty(
          currentFilter: filter,
          currentSearch: search,
          isFilteredOrSearched: isFilteredOrSearched,
        ),
      );
      return;
    }

    emit(
      MyServiceRequestsState.loaded(
        requests: paged.items,
        currentFilter: filter,
        currentSearch: search,
        totalCount: paged.totalCount,
        hasMore: paged.hasMore,
        currentPage: paged.page,
        isFilteredOrSearched: isFilteredOrSearched,
      ),
    );
  }
}
