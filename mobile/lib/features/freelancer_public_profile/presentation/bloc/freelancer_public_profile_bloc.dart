import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/freelancer_public_profile/domain/usecases/get_public_freelancer_profile_usecase.dart';
import 'package:mobile/features/freelancer_public_profile/presentation/bloc/freelancer_public_profile_event.dart';
import 'package:mobile/features/freelancer_public_profile/presentation/bloc/freelancer_public_profile_state.dart';

class FreelancerPublicProfileBloc
    extends Bloc<FreelancerPublicProfileEvent, FreelancerPublicProfileState> {
  final GetPublicFreelancerProfileUseCase getPublicFreelancerProfileUseCase;

  FreelancerPublicProfileBloc({
    required this.getPublicFreelancerProfileUseCase,
  }) : super(const FreelancerPublicProfileState.initial()) {
    on<FreelancerPublicProfileRequested>(_onRequested);
  }

  Future<void> _onRequested(
    FreelancerPublicProfileRequested event,
    Emitter<FreelancerPublicProfileState> emit,
  ) async {
    emit(const FreelancerPublicProfileState.loading());

    final result =
        await getPublicFreelancerProfileUseCase(event.freelancerId);

    result.fold(
      (failure) => emit(
        FreelancerPublicProfileState.failure(message: failure.message),
      ),
      (profile) => emit(
        FreelancerPublicProfileState.loaded(profile: profile),
      ),
    );
  }
}
