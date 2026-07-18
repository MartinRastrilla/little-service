import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/core/usecases/usecase.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_activity.dart';
import 'package:mobile/features/service_requests/domain/repositories/service_requests_repository.dart';

class GetServiceRequestActivityUseCase
    implements UseCase<ServiceRequestActivity, String> {
  final ServiceRequestsRepository repository;

  const GetServiceRequestActivityUseCase(this.repository);

  @override
  Future<Either<Failure, ServiceRequestActivity>> call(String serviceRequestId) {
    return repository.getServiceRequestActivity(serviceRequestId);
  }
}
