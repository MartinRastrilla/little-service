import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/features/service_requests/domain/entities/create_service_request_params.dart';
import 'package:mobile/features/service_requests/domain/entities/paged_service_requests_result.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_detail.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_info.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_filter_option.dart';

abstract class ServiceRequestsRepository {
  Future<Either<Failure, PagedServiceRequestsResult>> getMyServiceRequests({
    int page = 1,
    int pageSize = 20,
    ServiceRequestFilterOption? filter,
    String? search,
  });

  Future<Either<Failure, ServiceRequestDetail>> createServiceRequest(
    CreateServiceRequestParams params,
  );

  Future<Either<Failure, ServiceRequestInfo>> getServiceRequestInfo(
    String serviceRequestId,
  );
}
