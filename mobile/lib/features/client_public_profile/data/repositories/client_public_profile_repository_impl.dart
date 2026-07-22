import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failure_mapper.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/features/client_public_profile/data/datasources/client_public_profile_remote_datasource.dart';
import 'package:mobile/features/client_public_profile/domain/entities/client_public_profile.dart';
import 'package:mobile/features/client_public_profile/domain/repositories/client_public_profile_repository.dart';

class ClientPublicProfileRepositoryImpl implements ClientPublicProfileRepository {
  final ClientPublicProfileRemoteDataSource remote;

  const ClientPublicProfileRepositoryImpl({required this.remote});

  @override
  Future<Either<Failure, ClientPublicProfile>> getPublicProfile(
    String clientId,
  ) async {
    try {
      final model = await remote.getPublicProfile(clientId);
      return Right(model.toEntity());
    } catch (error) {
      return Left(mapExceptionToFailure(error));
    }
  }
}
