import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobile/core/error/exceptions.dart';
import 'package:mobile/features/service_requests/data/models/paged_service_requests_result_model.dart';
import 'package:mobile/features/service_requests/data/models/service_request_activity_model.dart';
import 'package:mobile/features/service_requests/data/models/service_request_application_model.dart';
import 'package:mobile/features/service_requests/data/models/service_request_detail_model.dart';
import 'package:mobile/features/service_requests/data/models/service_request_info_model.dart';
import 'package:mobile/features/service_requests/data/models/service_request_professional_model.dart';
import 'package:mobile/features/service_requests/domain/entities/create_service_request_params.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_filter_option.dart';
import 'package:mobile/features/service_requests/domain/entities/update_service_request_params.dart';

class ServiceRequestsRemoteDataSource {
  final Dio dio;

  const ServiceRequestsRemoteDataSource({required this.dio});

  Future<PagedServiceRequestsResultModel> getMyServiceRequests({
    int page = 1,
    int pageSize = 20,
    ServiceRequestFilterOption? filter,
    String? search,
  }) async {
    try {
      final response = await dio.get(
        '/service-requests/my',
        queryParameters: {
          'page': page,
          'pageSize': pageSize,
          if (filter != null && filter != ServiceRequestFilterOption.all)
            'filter': filter.apiValue,
          if (search != null && search.trim().isNotEmpty) 'search': search.trim(),
        },
      );

      final data = response.data;
      if (data is! Map<String, dynamic>) {
        throw ApiException(
          statusCode: response.statusCode,
          message: 'Formato de respuesta inválido',
          code: 'INVALID_RESPONSE',
        );
      }

      return PagedServiceRequestsResultModel.fromJson(data);
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  Future<ServiceRequestDetailModel> createServiceRequest(
    CreateServiceRequestParams params,
  ) async {
    try {
      final formData = FormData.fromMap({
        'title': params.title,
        'description': params.description,
        'location': params.location,
        if (params.price != null) 'price': params.price!.round().toString(),
      });

      for (final photo in params.photos) {
        formData.files.add(
          MapEntry(
            'photos',
            await MultipartFile.fromFile(
              photo.path,
              filename: photo.fileName,
            ),
          ),
        );
      }

      final response = await dio.post(
        '/service-requests',
        data: formData,
      );

      return ServiceRequestDetailModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  Future<ServiceRequestDetailModel> updateServiceRequest(
    UpdateServiceRequestParams params,
  ) async {
    try {
      final formData = FormData.fromMap({
        'title': params.title,
        'description': params.description,
        'location': params.location,
        'clearPrice': params.clearPrice.toString(),
        if (params.price != null) 'price': params.price!.round().toString(),
        if (params.deletedPhotoIds.isNotEmpty)
          'deletedPhotoIds': jsonEncode(params.deletedPhotoIds),
      });

      for (final photo in params.newPhotos) {
        formData.files.add(
          MapEntry(
            'photos',
            await MultipartFile.fromFile(
              photo.path,
              filename: photo.fileName,
            ),
          ),
        );
      }

      final response = await dio.put(
        '/service-requests/${params.serviceRequestId}',
        data: formData,
      );

      return ServiceRequestDetailModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  Future<void> cancelServiceRequest(String id) async {
    try {
      await dio.post('/service-requests/$id/cancel');
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  Future<ServiceRequestProfessionalModel> getServiceRequestProfessional(
    String id,
  ) async {
    try {
      final response = await dio.get('/service-requests/$id/professional');

      final data = response.data;
      if (data is! Map<String, dynamic>) {
        throw ApiException(
          statusCode: response.statusCode,
          message: 'Formato de respuesta inválido',
          code: 'INVALID_RESPONSE',
        );
      }

      return ServiceRequestProfessionalModel.fromJson(data);
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  Future<ServiceRequestProfessionalModel> cancelServiceRequestEngagement(
    String id,
  ) async {
    try {
      final response = await dio.post('/service-requests/$id/cancel-engagement');

      final data = response.data;
      if (data is! Map<String, dynamic>) {
        throw ApiException(
          statusCode: response.statusCode,
          message: 'Formato de respuesta inválido',
          code: 'INVALID_RESPONSE',
        );
      }

      return ServiceRequestProfessionalModel.fromJson(data);
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  Future<ServiceRequestInfoModel> getServiceRequestInfo(String id) async {
    try {
      final response = await dio.get('/service-requests/$id/info');

      final data = response.data;
      if (data is! Map<String, dynamic>) {
        throw ApiException(
          statusCode: response.statusCode,
          message: 'Formato de respuesta inválido',
          code: 'INVALID_RESPONSE',
        );
      }

      return ServiceRequestInfoModel.fromJson(data);
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  Future<ServiceRequestActivityModel> getServiceRequestActivity(String id) async {
    try {
      final response = await dio.get('/service-requests/$id/activity');

      final data = response.data;
      if (data is! Map<String, dynamic>) {
        throw ApiException(
          statusCode: response.statusCode,
          message: 'Formato de respuesta inválido',
          code: 'INVALID_RESPONSE',
        );
      }

      return ServiceRequestActivityModel.fromJson(data);
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  Future<ServiceRequestApplicationsResultModel> getServiceRequestApplications(
    String id,
  ) async {
    try {
      final response = await dio.get('/service-requests/$id/applications');

      final data = response.data;
      if (data is! Map<String, dynamic>) {
        throw ApiException(
          statusCode: response.statusCode,
          message: 'Formato de respuesta inválido',
          code: 'INVALID_RESPONSE',
        );
      }

      return ServiceRequestApplicationsResultModel.fromJson(data);
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  Future<ServiceRequestApplicationModel> acceptServiceRequestApplication({
    required String serviceRequestId,
    required String applicationId,
  }) async {
    try {
      final response = await dio.post(
        '/service-requests/$serviceRequestId/applications/$applicationId/accept',
      );

      final data = response.data;
      if (data is! Map<String, dynamic>) {
        throw ApiException(
          statusCode: response.statusCode,
          message: 'Formato de respuesta inválido',
          code: 'INVALID_RESPONSE',
        );
      }

      return ServiceRequestApplicationModel.fromJson(data);
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  Future<ServiceRequestApplicationModel> rejectServiceRequestApplication({
    required String serviceRequestId,
    required String applicationId,
  }) async {
    try {
      final response = await dio.post(
        '/service-requests/$serviceRequestId/applications/$applicationId/reject',
      );

      final data = response.data;
      if (data is! Map<String, dynamic>) {
        throw ApiException(
          statusCode: response.statusCode,
          message: 'Formato de respuesta inválido',
          code: 'INVALID_RESPONSE',
        );
      }

      return ServiceRequestApplicationModel.fromJson(data);
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  ApiException _mapDioException(DioException error) {
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;

    if (data is Map<String, dynamic>) {
      return ApiException(
        statusCode: statusCode,
        message: (data['message'] ?? 'Error de servidor').toString(),
        code: data['code']?.toString(),
      );
    }

    if (error.type == DioExceptionType.connectionError ||
        error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout) {
      return ApiException(
        statusCode: statusCode,
        message: 'No se pudo conectar con el servidor',
        code: 'NETWORK_ERROR',
      );
    }

    return ApiException(
      statusCode: statusCode,
      message: error.message ?? 'Error de red',
      code: 'NETWORK_ERROR',
    );
  }
}
