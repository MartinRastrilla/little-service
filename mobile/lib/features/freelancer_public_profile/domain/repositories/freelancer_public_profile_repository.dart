import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/features/freelancer_public_profile/domain/entities/freelancer_public_profile.dart';

abstract class FreelancerPublicProfileRepository {
  Future<Either<Failure, FreelancerPublicProfile>> getPublicProfile(
    String freelancerId,
  );
}
