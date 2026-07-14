import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/core/usecases/usecase.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_summary.dart';
import 'package:mobile/features/service_requests/domain/repositories/service_requests_repository.dart';

class GetMyServiceRequestsUseCase
    implements UseCase<List<ServiceRequestSummary>, NoParams> {
  final ServiceRequestsRepository repository;

  const GetMyServiceRequestsUseCase(this.repository);

  @override
  Future<Either<Failure, List<ServiceRequestSummary>>> call(NoParams params) {
    return repository.getMyServiceRequests();
  }
}
