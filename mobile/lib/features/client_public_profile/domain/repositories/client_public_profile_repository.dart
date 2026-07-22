import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/features/client_public_profile/domain/entities/client_public_profile.dart';

abstract class ClientPublicProfileRepository {
  Future<Either<Failure, ClientPublicProfile>> getPublicProfile(String clientId);
}
