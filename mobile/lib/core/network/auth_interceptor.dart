import 'package:dio/dio.dart';
import 'package:mobile/core/auth/auth_session_notifier.dart';
import 'package:mobile/core/network/token_storage.dart';
import 'package:mobile/features/auth/domain/repositories/auth_repository.dart';

class AuthInterceptor extends Interceptor {
  static const _retriedKey = 'retried';

  final TokenStorage tokenStorage;
  final AuthRepository authRepository;
  final AuthSessionNotifier sessionNotifier;
  Dio? _dio;

  AuthInterceptor({
    required this.tokenStorage,
    required this.authRepository,
    required this.sessionNotifier,
  });

  void attachDio(Dio dio) {
    _dio = dio;
  }

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
    final statusCode = err.response?.statusCode;
    final path = err.requestOptions.path;
    final alreadyRetried = err.requestOptions.extra[_retriedKey] == true;

    if (statusCode != 401 ||
        alreadyRetried ||
        _isAuthPath(path)) {
      handler.next(err);
      return;
    }

    final refreshResult = await authRepository.refreshSession();
    final refreshed = refreshResult.fold(
      (_) => false,
      (_) => true,
    );

    if (!refreshed) {
      sessionNotifier.notifyExpired();
      handler.next(err);
      return;
    }

    final newToken = await tokenStorage.read(TokenStorage.accessTokenKey);
    if (newToken == null || newToken.isEmpty) {
      sessionNotifier.notifyExpired();
      handler.next(err);
      return;
    }

    final requestOptions = err.requestOptions;
    requestOptions.extra[_retriedKey] = true;
    requestOptions.headers['Authorization'] = 'Bearer $newToken';

    try {
      final dio = _dio;
      if (dio == null) {
        handler.next(err);
        return;
      }

      final response = await dio.fetch(requestOptions);
      handler.resolve(response);
    } on DioException catch (retryError) {
      handler.next(retryError);
    }
  }

  bool _isAuthPath(String path) {
    return path.contains('/auth/login') ||
        path.contains('/auth/register') ||
        path.contains('/auth/refresh') ||
        path.contains('/auth/logout');
  }
}
