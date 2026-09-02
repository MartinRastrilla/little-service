import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_contract.dart';

abstract class ContractsRepository {
  Future<Either<Failure, ServiceRequestContract>> getContract(
    String serviceRequestId,
  );

  Future<Either<Failure, ServiceRequestContract>> createContract(
    UpsertContractParams params,
  );

  Future<Either<Failure, ServiceRequestContract>> updateContract(
    UpsertContractParams params,
  );

  Future<Either<Failure, ServiceRequestContract>> signContract(
    String serviceRequestId,
  );

  Future<Either<Failure, void>> cancelContract(String serviceRequestId);
}
