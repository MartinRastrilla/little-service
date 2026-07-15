import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/core/usecases/usecase.dart';
import 'package:mobile/features/service_requests/domain/entities/paged_service_requests_result.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_filter_option.dart';
import 'package:mobile/features/service_requests/domain/repositories/service_requests_repository.dart';

class GetMyServiceRequestsParams {
  final int page;
  final int pageSize;
  final ServiceRequestFilterOption filter;
  final String? search;

  const GetMyServiceRequestsParams({
    this.page = 1,
    this.pageSize = 20,
    this.filter = ServiceRequestFilterOption.all,
    this.search,
  });
}

class GetMyServiceRequestsUseCase
    implements UseCase<PagedServiceRequestsResult, GetMyServiceRequestsParams> {
  final ServiceRequestsRepository repository;

  const GetMyServiceRequestsUseCase(this.repository);

  @override
  Future<Either<Failure, PagedServiceRequestsResult>> call(
    GetMyServiceRequestsParams params,
  ) {
    return repository.getMyServiceRequests(
      page: params.page,
      pageSize: params.pageSize,
      filter: params.filter,
      search: params.search,
    );
  }
}
