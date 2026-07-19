import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/core/usecases/usecase.dart';
import 'package:mobile/features/freelancer_service_request_detail/domain/entities/open_service_request_detail.dart';
import 'package:mobile/features/freelancer_service_request_detail/domain/repositories/freelancer_service_request_detail_repository.dart';

class GetOpenServiceRequestDetailUseCase
    implements UseCase<OpenServiceRequestDetail, String> {
  final FreelancerServiceRequestDetailRepository repository;

  const GetOpenServiceRequestDetailUseCase(this.repository);

  @override
  Future<Either<Failure, OpenServiceRequestDetail>> call(String serviceRequestId) {
    return repository.getOpenDetail(serviceRequestId);
  }
}
