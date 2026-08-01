import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failure_mapper.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/features/service_requests/data/datasources/service_requests_remote_datasource.dart';
import 'package:mobile/features/service_requests/domain/entities/create_service_request_params.dart';
import 'package:mobile/features/service_requests/domain/entities/paged_service_requests_result.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_activity.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_application.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_detail.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_info.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_filter_option.dart';
import 'package:mobile/features/service_requests/domain/entities/update_service_request_params.dart';
import 'package:mobile/features/service_requests/domain/repositories/service_requests_repository.dart';

class ServiceRequestsRepositoryImpl implements ServiceRequestsRepository {
  final ServiceRequestsRemoteDataSource remote;

  ServiceRequestsRepositoryImpl({required this.remote});

  @override
  Future<Either<Failure, PagedServiceRequestsResult>> getMyServiceRequests({
    int page = 1,
    int pageSize = 20,
    ServiceRequestFilterOption? filter,
    String? search,
  }) async {
    try {
      final model = await remote.getMyServiceRequests(
        page: page,
        pageSize: pageSize,
        filter: filter,
        search: search,
      );
      return Right(model.toEntity());
    } catch (error) {
      return Left(mapExceptionToFailure(error));
    }
  }

  @override
  Future<Either<Failure, ServiceRequestDetail>> createServiceRequest(
    CreateServiceRequestParams params,
  ) async {
    try {
      final model = await remote.createServiceRequest(params);
      return Right(model.toEntity());
    } catch (error) {
      return Left(mapExceptionToFailure(error));
    }
  }

  @override
  Future<Either<Failure, ServiceRequestInfo>> getServiceRequestInfo(
    String serviceRequestId,
  ) async {
    try {
      final model = await remote.getServiceRequestInfo(serviceRequestId);
      return Right(model.toEntity());
    } catch (error) {
      return Left(mapExceptionToFailure(error));
    }
  }

  @override
  Future<Either<Failure, ServiceRequestActivity>> getServiceRequestActivity(
    String serviceRequestId,
  ) async {
    try {
      final model = await remote.getServiceRequestActivity(serviceRequestId);
      return Right(model.toEntity());
    } catch (error) {
      return Left(mapExceptionToFailure(error));
    }
  }

  @override
  Future<Either<Failure, ServiceRequestApplicationsResult>>
      getServiceRequestApplications(String serviceRequestId) async {
    try {
      final model = await remote.getServiceRequestApplications(serviceRequestId);
      return Right(model.toEntity());
    } catch (error) {
      return Left(mapExceptionToFailure(error));
    }
  }

  @override
  Future<Either<Failure, ServiceRequestApplication>>
      acceptServiceRequestApplication({
    required String serviceRequestId,
    required String applicationId,
  }) async {
    try {
      final model = await remote.acceptServiceRequestApplication(
        serviceRequestId: serviceRequestId,
        applicationId: applicationId,
      );
      return Right(model.toEntity());
    } catch (error) {
      return Left(mapExceptionToFailure(error));
    }
  }

  @override
  Future<Either<Failure, ServiceRequestApplication>>
      rejectServiceRequestApplication({
    required String serviceRequestId,
    required String applicationId,
  }) async {
    try {
      final model = await remote.rejectServiceRequestApplication(
        serviceRequestId: serviceRequestId,
        applicationId: applicationId,
      );
      return Right(model.toEntity());
    } catch (error) {
      return Left(mapExceptionToFailure(error));
    }
  }

  @override
  Future<Either<Failure, ServiceRequestDetail>> updateServiceRequest(
    UpdateServiceRequestParams params,
  ) async {
    try {
      final model = await remote.updateServiceRequest(params);
      return Right(model.toEntity());
    } catch (error) {
      return Left(mapExceptionToFailure(error));
    }
  }

  @override
  Future<Either<Failure, void>> cancelServiceRequest(
    String serviceRequestId,
  ) async {
    try {
      await remote.cancelServiceRequest(serviceRequestId);
      return const Right(null);
    } catch (error) {
      return Left(mapExceptionToFailure(error));
    }
  }
}
