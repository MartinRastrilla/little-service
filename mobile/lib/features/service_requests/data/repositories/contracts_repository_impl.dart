import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failure_mapper.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/features/service_requests/data/datasources/contracts_remote_datasource.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_contract.dart';
import 'package:mobile/features/service_requests/domain/repositories/contracts_repository.dart';

class ContractsRepositoryImpl implements ContractsRepository {
  final ContractsRemoteDataSource remote;

  ContractsRepositoryImpl({required this.remote});

  @override
  Future<Either<Failure, ServiceRequestContract>> getContract(
    String serviceRequestId,
  ) async {
    try {
      final model = await remote.getContract(serviceRequestId);
      return Right(model.toEntity());
    } catch (error) {
      return Left(mapExceptionToFailure(error));
    }
  }

  @override
  Future<Either<Failure, ServiceRequestContract>> createContract(
    UpsertContractParams params,
  ) async {
    try {
      final model = await remote.createContract(params);
      return Right(model.toEntity());
    } catch (error) {
      return Left(mapExceptionToFailure(error));
    }
  }

  @override
  Future<Either<Failure, ServiceRequestContract>> updateContract(
    UpsertContractParams params,
  ) async {
    try {
      final model = await remote.updateContract(params);
      return Right(model.toEntity());
    } catch (error) {
      return Left(mapExceptionToFailure(error));
    }
  }
}
