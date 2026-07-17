import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile/core/auth/auth_session_notifier.dart';
import 'package:mobile/core/network/auth_interceptor.dart';
import 'package:mobile/core/network/dio_client.dart';
import 'package:mobile/core/network/token_storage.dart';
import 'package:mobile/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:mobile/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:mobile/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:mobile/features/auth/domain/usecases/check_session_usecase.dart';
import 'package:mobile/features/auth/domain/usecases/login_usecase.dart';
import 'package:mobile/features/auth/domain/usecases/logout_usecase.dart';
import 'package:mobile/features/auth/domain/usecases/register_usecase.dart';
import 'package:mobile/features/auth/domain/usecases/refresh_token_usecase.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile/features/service_requests/data/datasources/service_requests_remote_datasource.dart';
import 'package:mobile/features/service_requests/data/repositories/service_requests_repository_impl.dart';
import 'package:mobile/features/service_requests/domain/repositories/service_requests_repository.dart';
import 'package:mobile/features/service_requests/domain/usecases/create_service_request_usecase.dart';
import 'package:mobile/features/service_requests/domain/usecases/get_service_request_info_usecase.dart';
import 'package:mobile/features/service_requests/domain/usecases/get_my_service_requests_usecase.dart';
import 'package:mobile/features/service_requests/presentation/bloc/service_request_detail/service_request_detail_bloc.dart';
import 'package:mobile/features/service_requests/presentation/bloc/create_service_request/create_service_request_bloc.dart';
import 'package:mobile/features/service_requests/presentation/bloc/my_service_requests_bloc.dart';

const authDioInstanceName = 'authDio';
const apiDioInstanceName = 'apiDio';

final sl = GetIt.instance;

Future<void> setupDependencyInjection() async {
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  sl.registerLazySingleton(() => TokenStorage(sl()));
  sl.registerLazySingleton(() => AuthLocalDataSource(sl()));
  sl.registerLazySingleton(AuthSessionNotifier.new);

  sl.registerLazySingleton<Dio>(
    buildAuthDio,
    instanceName: authDioInstanceName,
  );

  sl.registerLazySingleton(
    () => AuthRemoteDataSource(
      dio: sl<Dio>(instanceName: authDioInstanceName),
    ),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remote: sl(), local: sl()),
  );

  sl.registerLazySingleton(
    () => AuthInterceptor(
      tokenStorage: sl(),
      authRepository: sl(),
      sessionNotifier: sl(),
    ),
  );

  sl.registerLazySingleton<Dio>(() {
    final authInterceptor = sl<AuthInterceptor>();
    final apiDio = buildApiDio(authInterceptor);
    authInterceptor.attachDio(apiDio);
    return apiDio;
  }, instanceName: apiDioInstanceName);

  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));
  sl.registerLazySingleton(() => CheckSessionUseCase(sl()));
  sl.registerLazySingleton(() => RefreshTokenUseCase(sl()));

  sl.registerFactory(
    () => AuthBloc(
      loginUseCase: sl(),
      registerUseCase: sl(),
      logoutUseCase: sl(),
      checkSessionUseCase: sl(),
      sessionNotifier: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => ServiceRequestsRemoteDataSource(
      dio: sl<Dio>(instanceName: apiDioInstanceName),
    ),
  );

  sl.registerLazySingleton<ServiceRequestsRepository>(
    () => ServiceRequestsRepositoryImpl(remote: sl()),
  );

  sl.registerLazySingleton(() => GetMyServiceRequestsUseCase(sl()));
  sl.registerLazySingleton(() => CreateServiceRequestUseCase(sl()));
  sl.registerLazySingleton(() => GetServiceRequestInfoUseCase(sl()));

  sl.registerFactory(
    () => MyServiceRequestsBloc(getMyServiceRequestsUseCase: sl()),
  );

  sl.registerFactory(
    () => CreateServiceRequestBloc(createServiceRequestUseCase: sl()),
  );

  sl.registerFactory(
    () => ServiceRequestDetailBloc(getServiceRequestInfoUseCase: sl()),
  );
}
