import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/usecases/usecase.dart';
import 'package:mobile/features/service_requests/domain/usecases/get_my_service_requests_usecase.dart';
import 'package:mobile/features/service_requests/presentation/bloc/my_service_requests_event.dart';
import 'package:mobile/features/service_requests/presentation/bloc/my_service_requests_state.dart';

class MyServiceRequestsBloc
    extends Bloc<MyServiceRequestsEvent, MyServiceRequestsState> {
  final GetMyServiceRequestsUseCase getMyServiceRequestsUseCase;

  MyServiceRequestsBloc({required this.getMyServiceRequestsUseCase})
    : super(const MyServiceRequestsState.initial()) {
    on<MyServiceRequestsRequested>(_onRequested);
  }

  Future<void> _onRequested(
    MyServiceRequestsRequested event,
    Emitter<MyServiceRequestsState> emit,
  ) async {
    emit(const MyServiceRequestsState.loading());

    final result = await getMyServiceRequestsUseCase(const NoParams());
    result.fold(
      (failure) => emit(
        MyServiceRequestsState.failure(message: failure.message),
      ),
      (requests) {
        if (requests.isEmpty) {
          emit(const MyServiceRequestsState.empty());
          return;
        }

        emit(MyServiceRequestsState.loaded(requests: requests));
      },
    );
  }
}
