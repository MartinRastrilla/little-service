import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/features/freelancer_home/domain/entities/open_service_request_date_filter.dart';
import 'package:mobile/features/freelancer_home/domain/entities/open_service_request_summary.dart';

abstract class FreelancerHomeRepository {
  Future<Either<Failure, List<OpenServiceRequestSummary>>> getOpenServiceRequests({
    OpenServiceRequestDateFilter filter = OpenServiceRequestDateFilter.all,
    String? search,
  });
}
