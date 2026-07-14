import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_summary.dart';

abstract class ServiceRequestsRepository {
  Future<Either<Failure, List<ServiceRequestSummary>>> getMyServiceRequests();
}
