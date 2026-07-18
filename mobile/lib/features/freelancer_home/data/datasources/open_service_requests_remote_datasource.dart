import 'package:dio/dio.dart';
import 'package:mobile/core/error/exceptions.dart';
import 'package:mobile/features/freelancer_home/data/models/open_service_request_summary_model.dart';
import 'package:mobile/features/freelancer_home/domain/entities/open_service_request_date_filter.dart';

class OpenServiceRequestsRemoteDataSource {
  final Dio dio;

  const OpenServiceRequestsRemoteDataSource({required this.dio});

  Future<List<OpenServiceRequestSummaryModel>> getOpenServiceRequests({
    OpenServiceRequestDateFilter filter = OpenServiceRequestDateFilter.all,
    String? search,
  }) async {
    try {
      final trimmedSearch = search?.trim();
      final response = await dio.get(
        '/service-requests/open',
        queryParameters: {
          'filter': filter.apiValue,
          'timezoneOffsetMinutes': DateTime.now().timeZoneOffset.inMinutes,
          if (trimmedSearch != null && trimmedSearch.length >= 2)
            'search': trimmedSearch,
        },
      );

      final data = response.data;
      if (data is! List) {
        throw ApiException(
          statusCode: response.statusCode,
          message: 'Formato de respuesta inválido',
          code: 'INVALID_RESPONSE',
        );
      }

      return data
          .whereType<Map<String, dynamic>>()
          .map(OpenServiceRequestSummaryModel.fromJson)
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
