import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/core/usecases/usecase.dart';
import 'package:mobile/features/service_requests/domain/repositories/contracts_repository.dart';

class CancelContractUseCase implements UseCase<void, String> {
  final ContractsRepository repository;

  const CancelContractUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(String serviceRequestId) {
    return repository.cancelContract(serviceRequestId);
  }
}
