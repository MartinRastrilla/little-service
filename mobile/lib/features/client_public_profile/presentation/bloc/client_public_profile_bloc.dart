import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/client_public_profile/domain/usecases/get_public_client_profile_usecase.dart';
import 'package:mobile/features/client_public_profile/presentation/bloc/client_public_profile_event.dart';
import 'package:mobile/features/client_public_profile/presentation/bloc/client_public_profile_state.dart';

class ClientPublicProfileBloc
    extends Bloc<ClientPublicProfileEvent, ClientPublicProfileState> {
  final GetPublicClientProfileUseCase getPublicClientProfileUseCase;

  ClientPublicProfileBloc({
    required this.getPublicClientProfileUseCase,
  }) : super(const ClientPublicProfileState.initial()) {
    on<ClientPublicProfileRequested>(_onRequested);
  }

  Future<void> _onRequested(
    ClientPublicProfileRequested event,
    Emitter<ClientPublicProfileState> emit,
  ) async {
    emit(const ClientPublicProfileState.loading());

    final result = await getPublicClientProfileUseCase(event.clientId);

    result.fold(
      (failure) => emit(
        ClientPublicProfileState.failure(message: failure.message),
      ),
      (profile) => emit(
        ClientPublicProfileState.loaded(profile: profile),
      ),
    );
  }
}
