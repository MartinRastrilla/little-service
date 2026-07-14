import 'package:dio/dio.dart';
import 'package:mobile/core/error/exceptions.dart';
import 'package:mobile/features/service_requests/data/models/service_request_summary_model.dart';

class ServiceRequestsRemoteDataSource {
  final Dio dio;

  const ServiceRequestsRemoteDataSource({required this.dio});

  Future<List<ServiceRequestSummaryModel>> getMyServiceRequests() async {
    try {
      final response = await dio.get('/service-requests/my');
      final data = response.data;

      if (data is! List) {
        throw ApiException(
          statusCode: response.statusCode,
          message: 'Formato de respuesta inválido',
          code: 'INVALID_RESPONSE',
        );
      }

      return data
          .map(
            (item) => ServiceRequestSummaryModel.fromJson(
              item as Map<String, dynamic>,
            ),
          )
          .toList();
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
