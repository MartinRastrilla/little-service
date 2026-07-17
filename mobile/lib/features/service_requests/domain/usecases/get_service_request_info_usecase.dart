import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/core/usecases/usecase.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_info.dart';
import 'package:mobile/features/service_requests/domain/repositories/service_requests_repository.dart';

class GetServiceRequestInfoUseCase
    implements UseCase<ServiceRequestInfo, String> {
  final ServiceRequestsRepository repository;

  const GetServiceRequestInfoUseCase(this.repository);

  @override
  Future<Either<Failure, ServiceRequestInfo>> call(String serviceRequestId) {
    return repository.getServiceRequestInfo(serviceRequestId);
  }
}
