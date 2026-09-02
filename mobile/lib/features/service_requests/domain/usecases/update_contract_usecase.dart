import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/core/usecases/usecase.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_contract.dart';
import 'package:mobile/features/service_requests/domain/repositories/contracts_repository.dart';

class UpdateContractUseCase
    implements UseCase<ServiceRequestContract, UpsertContractParams> {
  final ContractsRepository repository;

  const UpdateContractUseCase(this.repository);

  @override
  Future<Either<Failure, ServiceRequestContract>> call(
    UpsertContractParams params,
  ) {
    return repository.updateContract(params);
  }
}
