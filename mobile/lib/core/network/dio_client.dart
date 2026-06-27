import 'package:dio/dio.dart';
import 'package:mobile/core/config/env.dart';
import 'package:mobile/core/network/auth_interceptor.dart';

Dio buildDio(AuthInterceptor authInterceptor) {
  final dio = Dio(
    BaseOptions(
      baseUrl: Env.baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 20),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  dio.interceptors.add(authInterceptor);
  return dio;
}
