import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/core/usecases/usecase.dart';
import 'package:mobile/features/freelancer_home/domain/entities/open_service_request_date_filter.dart';
import 'package:mobile/features/freelancer_home/domain/entities/open_service_request_summary.dart';
import 'package:mobile/features/freelancer_home/domain/repositories/freelancer_home_repository.dart';

class GetOpenServiceRequestsParams {
  final OpenServiceRequestDateFilter filter;
  final String? search;

  const GetOpenServiceRequestsParams({
    this.filter = OpenServiceRequestDateFilter.all,
    this.search,
  });
}

class GetOpenServiceRequestsUseCase
    implements UseCase<List<OpenServiceRequestSummary>, GetOpenServiceRequestsParams> {
  final FreelancerHomeRepository repository;

  const GetOpenServiceRequestsUseCase(this.repository);

  @override
  Future<Either<Failure, List<OpenServiceRequestSummary>>> call(
    GetOpenServiceRequestsParams params,
  ) {
    return repository.getOpenServiceRequests(
      filter: params.filter,
      search: params.search,
    );
  }
}
