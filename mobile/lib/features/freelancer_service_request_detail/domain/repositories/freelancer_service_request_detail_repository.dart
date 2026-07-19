import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/features/freelancer_service_request_detail/domain/entities/open_service_request_detail.dart';

abstract class FreelancerServiceRequestDetailRepository {
  Future<Either<Failure, OpenServiceRequestDetail>> getOpenDetail(
    String serviceRequestId,
  );

  Future<Either<Failure, void>> applyToServiceRequest(String serviceRequestId);
}
