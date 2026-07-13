import 'package:dio/dio.dart';
import 'package:mobile/core/error/exceptions.dart';
import 'package:mobile/features/auth/data/models/auth_response_model.dart';

class AuthRemoteDataSource {
  final Dio dio;

  const AuthRemoteDataSource({required this.dio});

  Future<AuthResponseModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        '/auth/login',
        data: {'email': email, 'password': password},
      );
      return AuthResponseModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  Future<AuthResponseModel> refresh({required String refreshToken}) async {
    try {
      final response = await dio.post(
        '/auth/refresh',
        data: {'refreshToken': refreshToken},
      );
      return AuthResponseModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  Future<void> logoutRemote({required String refreshToken}) async {
    try {
      await dio.post(
        '/auth/logout',
        data: {'refreshToken': refreshToken},
      );
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  Future<AuthResponseModel> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required List<String> roles,
  }) async {
    try {
      final response = await dio.post(
        '/auth/register',
        data: {
          'name': name,
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword,
          'roles': roles,
        },
      );
      return AuthResponseModel.fromJson(response.data as Map<String, dynamic>);
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
