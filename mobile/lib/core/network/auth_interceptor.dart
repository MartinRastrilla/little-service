import 'package:dio/dio.dart';
import 'package:mobile/core/network/token_storage.dart';

class AuthInterceptor extends Interceptor {
  final TokenStorage tokenStorage;

  AuthInterceptor(this.tokenStorage);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await tokenStorage.read(TokenStorage.accessTokenKey);
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // TODO(refresh-token): if err.response?.statusCode == 401
    //   → await refreshTokenUseCase()
    //   → retry original request
    //   → if refresh fails → clear session + notify AuthBloc
    handler.next(err);
  }
}
