import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failure_mapper.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/features/freelancer_public_profile/data/datasources/freelancer_public_profile_remote_datasource.dart';
import 'package:mobile/features/freelancer_public_profile/domain/entities/freelancer_public_profile.dart';
import 'package:mobile/features/freelancer_public_profile/domain/repositories/freelancer_public_profile_repository.dart';

class FreelancerPublicProfileRepositoryImpl
    implements FreelancerPublicProfileRepository {
  final FreelancerPublicProfileRemoteDataSource remote;

  const FreelancerPublicProfileRepositoryImpl({required this.remote});

  @override
  Future<Either<Failure, FreelancerPublicProfile>> getPublicProfile(
    String freelancerId,
  ) async {
    try {
      final model = await remote.getPublicProfile(freelancerId);
      return Right(model.toEntity());
    } catch (error) {
      return Left(mapExceptionToFailure(error));
    }
  }
}
