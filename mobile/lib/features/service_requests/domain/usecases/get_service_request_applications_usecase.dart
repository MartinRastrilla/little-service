import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/core/usecases/usecase.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_application.dart';
import 'package:mobile/features/service_requests/domain/repositories/service_requests_repository.dart';

class GetServiceRequestApplicationsUseCase
    implements UseCase<ServiceRequestApplicationsResult, String> {
  final ServiceRequestsRepository repository;

  const GetServiceRequestApplicationsUseCase(this.repository);

  @override
  Future<Either<Failure, ServiceRequestApplicationsResult>> call(
    String serviceRequestId,
  ) {
    return repository.getServiceRequestApplications(serviceRequestId);
  }
}
