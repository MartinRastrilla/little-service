import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failure_mapper.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/features/freelancer_service_request_detail/data/datasources/freelancer_service_request_detail_remote_datasource.dart';
import 'package:mobile/features/freelancer_service_request_detail/domain/entities/open_service_request_detail.dart';
import 'package:mobile/features/freelancer_service_request_detail/domain/repositories/freelancer_service_request_detail_repository.dart';

class FreelancerServiceRequestDetailRepositoryImpl
    implements FreelancerServiceRequestDetailRepository {
  final FreelancerServiceRequestDetailRemoteDataSource remote;

  const FreelancerServiceRequestDetailRepositoryImpl({required this.remote});

  @override
  Future<Either<Failure, OpenServiceRequestDetail>> getOpenDetail(
    String serviceRequestId,
  ) async {
    try {
      final model = await remote.getOpenDetail(serviceRequestId);
      return Right(model.toEntity());
    } catch (error) {
      return Left(mapExceptionToFailure(error));
    }
  }

  @override
  Future<Either<Failure, void>> applyToServiceRequest(
    String serviceRequestId,
  ) async {
    try {
      await remote.applyToServiceRequest(serviceRequestId);
      return const Right(null);
    } catch (error) {
      return Left(mapExceptionToFailure(error));
    }
  }
}
