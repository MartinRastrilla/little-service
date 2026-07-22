import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/core/usecases/usecase.dart';
import 'package:mobile/features/freelancer_public_profile/domain/entities/freelancer_public_profile.dart';
import 'package:mobile/features/freelancer_public_profile/domain/repositories/freelancer_public_profile_repository.dart';

class GetPublicFreelancerProfileUseCase
    implements UseCase<FreelancerPublicProfile, String> {
  final FreelancerPublicProfileRepository repository;

  const GetPublicFreelancerProfileUseCase(this.repository);

  @override
  Future<Either<Failure, FreelancerPublicProfile>> call(String freelancerId) {
    return repository.getPublicProfile(freelancerId);
  }
}
