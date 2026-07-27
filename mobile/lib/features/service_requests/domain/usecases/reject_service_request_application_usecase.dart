import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/core/usecases/usecase.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_application.dart';
import 'package:mobile/features/service_requests/domain/repositories/service_requests_repository.dart';

class RejectServiceRequestApplicationParams {
  final String serviceRequestId;
  final String applicationId;

  const RejectServiceRequestApplicationParams({
    required this.serviceRequestId,
    required this.applicationId,
  });
}

class RejectServiceRequestApplicationUseCase
    implements UseCase<ServiceRequestApplication, RejectServiceRequestApplicationParams> {
  final ServiceRequestsRepository repository;

  const RejectServiceRequestApplicationUseCase(this.repository);

  @override
  Future<Either<Failure, ServiceRequestApplication>> call(
    RejectServiceRequestApplicationParams params,
  ) {
    return repository.rejectServiceRequestApplication(
      serviceRequestId: params.serviceRequestId,
      applicationId: params.applicationId,
    );
  }
}
