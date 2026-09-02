import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/core/usecases/usecase.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_contract.dart';
import 'package:mobile/features/service_requests/domain/repositories/contracts_repository.dart';

class SignContractUseCase implements UseCase<ServiceRequestContract, String> {
  final ContractsRepository repository;

  const SignContractUseCase(this.repository);

  @override
  Future<Either<Failure, ServiceRequestContract>> call(String serviceRequestId) {
    return repository.signContract(serviceRequestId);
  }
}
