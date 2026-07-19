import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/core/usecases/usecase.dart';
import 'package:mobile/features/freelancer_service_request_detail/domain/repositories/freelancer_service_request_detail_repository.dart';

class ApplyToOpenServiceRequestUseCase implements UseCase<void, String> {
  final FreelancerServiceRequestDetailRepository repository;

  const ApplyToOpenServiceRequestUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(String serviceRequestId) {
    return repository.applyToServiceRequest(serviceRequestId);
  }
}
