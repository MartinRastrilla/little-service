import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/core/usecases/usecase.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_application.dart';
import 'package:mobile/features/service_requests/domain/repositories/service_requests_repository.dart';

class AcceptServiceRequestApplicationParams {
  final String serviceRequestId;
  final String applicationId;

  const AcceptServiceRequestApplicationParams({
    required this.serviceRequestId,
    required this.applicationId,
  });
}

class AcceptServiceRequestApplicationUseCase
    implements UseCase<ServiceRequestApplication, AcceptServiceRequestApplicationParams> {
  final ServiceRequestsRepository repository;

  const AcceptServiceRequestApplicationUseCase(this.repository);

  @override
  Future<Either<Failure, ServiceRequestApplication>> call(
    AcceptServiceRequestApplicationParams params,
  ) {
    return repository.acceptServiceRequestApplication(
      serviceRequestId: params.serviceRequestId,
      applicationId: params.applicationId,
    );
  }
}
