import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/core/usecases/usecase.dart';
import 'package:mobile/features/client_public_profile/domain/entities/client_public_profile.dart';
import 'package:mobile/features/client_public_profile/domain/repositories/client_public_profile_repository.dart';

class GetPublicClientProfileUseCase
    implements UseCase<ClientPublicProfile, String> {
  final ClientPublicProfileRepository repository;

  const GetPublicClientProfileUseCase(this.repository);

  @override
  Future<Either<Failure, ClientPublicProfile>> call(String clientId) {
    return repository.getPublicProfile(clientId);
  }
}
