import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/core/usecases/usecase.dart';
import 'package:mobile/features/service_requests/domain/entities/create_service_request_params.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_detail.dart';
import 'package:mobile/features/service_requests/domain/repositories/service_requests_repository.dart';

class CreateServiceRequestUseCase
    implements UseCase<ServiceRequestDetail, CreateServiceRequestParams> {
  final ServiceRequestsRepository repository;

  const CreateServiceRequestUseCase(this.repository);

  @override
  Future<Either<Failure, ServiceRequestDetail>> call(
    CreateServiceRequestParams params,
  ) {
    return repository.createServiceRequest(params);
  }
}
