import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
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
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> setupDependencyInjection() async {
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  sl.registerLazySingleton(() => TokenStorage(sl()));
  sl.registerLazySingleton(() => AuthLocalDataSource(sl()));
  sl.registerLazySingleton(() => AuthInterceptor(sl()));
  sl.registerLazySingleton<Dio>(() => buildDio(sl()));

  sl.registerLazySingleton(() => AuthRemoteDataSource(dio: sl()));

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remote: sl(), local: sl()),
  );

  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));
  sl.registerLazySingleton(() => CheckSessionUseCase(sl()));

  sl.registerFactory(
    () => AuthBloc(
      loginUseCase: sl(),
      logoutUseCase: sl(),
      checkSessionUseCase: sl(),
    ),
  );
}
