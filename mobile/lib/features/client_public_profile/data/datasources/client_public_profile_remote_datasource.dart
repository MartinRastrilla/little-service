import 'package:dio/dio.dart';
import 'package:mobile/core/error/exceptions.dart';
import 'package:mobile/features/client_public_profile/data/models/client_public_profile_model.dart';

class ClientPublicProfileRemoteDataSource {
  final Dio dio;

  const ClientPublicProfileRemoteDataSource({required this.dio});

  Future<ClientPublicProfileModel> getPublicProfile(String clientId) async {
    try {
      final response = await dio.get('/clients/$clientId/public-profile');
      final data = response.data;
      if (data is! Map<String, dynamic>) {
        throw ApiException(
          statusCode: response.statusCode,
          message: 'Formato de respuesta inválido',
          code: 'INVALID_RESPONSE',
        );
      }
      return ClientPublicProfileModel.fromJson(data);
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
