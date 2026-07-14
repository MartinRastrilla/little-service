import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failure_mapper.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/features/service_requests/data/datasources/service_requests_remote_datasource.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_summary.dart';
import 'package:mobile/features/service_requests/domain/repositories/service_requests_repository.dart';

class ServiceRequestsRepositoryImpl implements ServiceRequestsRepository {
  final ServiceRequestsRemoteDataSource remote;

  ServiceRequestsRepositoryImpl({required this.remote});

  @override
  Future<Either<Failure, List<ServiceRequestSummary>>> getMyServiceRequests() async {
    try {
      final models = await remote.getMyServiceRequests();
      return Right(models.map((model) => model.toEntity()).toList());
    } catch (error) {
      return Left(mapExceptionToFailure(error));
    }
  }
}
