import 'package:dio/dio.dart';
import 'package:mobile/core/error/exceptions.dart';
import 'package:mobile/features/freelancer_service_request_detail/data/models/open_service_request_detail_model.dart';

class FreelancerServiceRequestDetailRemoteDataSource {
  final Dio dio;

  const FreelancerServiceRequestDetailRemoteDataSource({required this.dio});

  Future<OpenServiceRequestDetailModel> getOpenDetail(String serviceRequestId) async {
    try {
      final response = await dio.get('/service-requests/$serviceRequestId/open-detail');
      final data = response.data;
      if (data is! Map<String, dynamic>) {
        throw ApiException(
          statusCode: response.statusCode,
          message: 'Formato de respuesta inválido',
          code: 'INVALID_RESPONSE',
        );
      }
      return OpenServiceRequestDetailModel.fromJson(data);
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  Future<void> applyToServiceRequest(String serviceRequestId) async {
    try {
      await dio.post('/service-requests/$serviceRequestId/apply');
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
