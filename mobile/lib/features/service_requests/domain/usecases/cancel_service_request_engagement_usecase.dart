import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/core/usecases/usecase.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_professional.dart';
import 'package:mobile/features/service_requests/domain/repositories/service_requests_repository.dart';

class CancelServiceRequestEngagementUseCase
    implements UseCase<ServiceRequestProfessional, String> {
  final ServiceRequestsRepository repository;

  const CancelServiceRequestEngagementUseCase(this.repository);

  @override
  Future<Either<Failure, ServiceRequestProfessional>> call(
    String serviceRequestId,
  ) {
    return repository.cancelServiceRequestEngagement(serviceRequestId);
  }
}
