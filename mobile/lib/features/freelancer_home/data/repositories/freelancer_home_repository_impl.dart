import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failure_mapper.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/features/freelancer_home/data/datasources/open_service_requests_remote_datasource.dart';
import 'package:mobile/features/freelancer_home/domain/entities/open_service_request_date_filter.dart';
import 'package:mobile/features/freelancer_home/domain/entities/open_service_request_summary.dart';
import 'package:mobile/features/freelancer_home/domain/repositories/freelancer_home_repository.dart';

class FreelancerHomeRepositoryImpl implements FreelancerHomeRepository {
  final OpenServiceRequestsRemoteDataSource remote;

  const FreelancerHomeRepositoryImpl({required this.remote});

  @override
  Future<Either<Failure, List<OpenServiceRequestSummary>>> getOpenServiceRequests({
    OpenServiceRequestDateFilter filter = OpenServiceRequestDateFilter.all,
    String? search,
  }) async {
    try {
      final models = await remote.getOpenServiceRequests(
        filter: filter,
        search: search,
      );
      return Right(models.map((model) => model.toEntity()).toList());
    } catch (error) {
      return Left(mapExceptionToFailure(error));
    }
  }
}
