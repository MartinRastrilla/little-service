import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/core/usecases/usecase.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_detail.dart';
import 'package:mobile/features/service_requests/domain/entities/update_service_request_params.dart';
import 'package:mobile/features/service_requests/domain/repositories/service_requests_repository.dart';

class UpdateServiceRequestUseCase
    implements UseCase<ServiceRequestDetail, UpdateServiceRequestParams> {
  final ServiceRequestsRepository repository;

  const UpdateServiceRequestUseCase(this.repository);

  @override
  Future<Either<Failure, ServiceRequestDetail>> call(
    UpdateServiceRequestParams params,
  ) {
    return repository.updateServiceRequest(params);
  }
}
