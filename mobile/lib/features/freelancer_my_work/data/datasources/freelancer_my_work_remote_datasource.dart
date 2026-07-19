import 'package:dio/dio.dart';
import 'package:mobile/core/error/exceptions.dart';
import 'package:mobile/features/freelancer_my_work/data/models/freelancer_work_item_model.dart';
import 'package:mobile/features/freelancer_my_work/domain/entities/freelancer_work_item.dart';

class FreelancerMyWorkRemoteDataSource {
  final Dio dio;

  const FreelancerMyWorkRemoteDataSource({required this.dio});

  Future<List<FreelancerWorkItemModel>> getApplications({
    FreelancerApplicationFilter filter = FreelancerApplicationFilter.all,
  }) async {
    return _fetchList(
      '/freelancer/applications',
      queryParameters: {'status': filter.apiValue},
    );
  }

  Future<List<FreelancerWorkItemModel>> getJobs({
    FreelancerJobFilter filter = FreelancerJobFilter.all,
  }) async {
    return _fetchList(
      '/freelancer/jobs',
      queryParameters: {'filter': filter.apiValue},
    );
  }

  Future<List<FreelancerWorkItemModel>> _fetchList(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(path, queryParameters: queryParameters);
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
          .map(FreelancerWorkItemModel.fromJson)
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
