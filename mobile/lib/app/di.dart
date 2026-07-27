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
import 'package:mobile/features/service_requests/domain/usecases/get_service_request_activity_usecase.dart';
import 'package:mobile/features/service_requests/domain/usecases/get_service_request_info_usecase.dart';
import 'package:mobile/features/service_requests/domain/usecases/get_service_request_applications_usecase.dart';
import 'package:mobile/features/service_requests/domain/usecases/accept_service_request_application_usecase.dart';
import 'package:mobile/features/service_requests/domain/usecases/reject_service_request_application_usecase.dart';
import 'package:mobile/features/service_requests/domain/usecases/get_my_service_requests_usecase.dart';
import 'package:mobile/features/service_requests/presentation/bloc/service_request_detail/service_request_detail_bloc.dart';
import 'package:mobile/features/service_requests/presentation/bloc/service_request_applications/service_request_applications_bloc.dart';
import 'package:mobile/features/service_requests/presentation/bloc/create_service_request/create_service_request_bloc.dart';
import 'package:mobile/features/service_requests/presentation/bloc/my_service_requests_bloc.dart';
import 'package:mobile/features/freelancer_home/data/datasources/open_service_requests_remote_datasource.dart';
import 'package:mobile/features/freelancer_home/data/repositories/freelancer_home_repository_impl.dart';
import 'package:mobile/features/freelancer_home/domain/repositories/freelancer_home_repository.dart';
import 'package:mobile/features/freelancer_home/domain/usecases/get_open_service_requests_usecase.dart';
import 'package:mobile/features/freelancer_home/presentation/bloc/freelancer_home_bloc.dart';
import 'package:mobile/features/freelancer_service_request_detail/data/datasources/freelancer_service_request_detail_remote_datasource.dart';
import 'package:mobile/features/freelancer_service_request_detail/data/repositories/freelancer_service_request_detail_repository_impl.dart';
import 'package:mobile/features/freelancer_service_request_detail/domain/repositories/freelancer_service_request_detail_repository.dart';
import 'package:mobile/features/freelancer_service_request_detail/domain/usecases/apply_to_open_service_request_usecase.dart';
import 'package:mobile/features/freelancer_service_request_detail/domain/usecases/get_open_service_request_detail_usecase.dart';
import 'package:mobile/features/freelancer_service_request_detail/presentation/bloc/freelancer_service_request_detail_bloc.dart';
import 'package:mobile/features/freelancer_my_work/data/datasources/freelancer_my_work_remote_datasource.dart';
import 'package:mobile/features/freelancer_my_work/data/repositories/freelancer_my_work_repository_impl.dart';
import 'package:mobile/features/freelancer_my_work/domain/repositories/freelancer_my_work_repository.dart';
import 'package:mobile/features/freelancer_my_work/domain/usecases/get_freelancer_applications_usecase.dart';
import 'package:mobile/features/freelancer_my_work/domain/usecases/get_freelancer_jobs_usecase.dart';
import 'package:mobile/features/freelancer_my_work/presentation/bloc/freelancer_my_work_bloc.dart';
import 'package:mobile/features/client_public_profile/data/datasources/client_public_profile_remote_datasource.dart';
import 'package:mobile/features/client_public_profile/data/repositories/client_public_profile_repository_impl.dart';
import 'package:mobile/features/client_public_profile/domain/repositories/client_public_profile_repository.dart';
import 'package:mobile/features/client_public_profile/domain/usecases/get_public_client_profile_usecase.dart';
import 'package:mobile/features/client_public_profile/presentation/bloc/client_public_profile_bloc.dart';
import 'package:mobile/features/freelancer_public_profile/data/datasources/freelancer_public_profile_remote_datasource.dart';
import 'package:mobile/features/freelancer_public_profile/data/repositories/freelancer_public_profile_repository_impl.dart';
import 'package:mobile/features/freelancer_public_profile/domain/repositories/freelancer_public_profile_repository.dart';
import 'package:mobile/features/freelancer_public_profile/domain/usecases/get_public_freelancer_profile_usecase.dart';
import 'package:mobile/features/freelancer_public_profile/presentation/bloc/freelancer_public_profile_bloc.dart';

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
  sl.registerLazySingleton(() => GetServiceRequestActivityUseCase(sl()));
  sl.registerLazySingleton(() => GetServiceRequestApplicationsUseCase(sl()));
  sl.registerLazySingleton(() => AcceptServiceRequestApplicationUseCase(sl()));
  sl.registerLazySingleton(() => RejectServiceRequestApplicationUseCase(sl()));

  sl.registerFactory(
    () => MyServiceRequestsBloc(getMyServiceRequestsUseCase: sl()),
  );

  sl.registerFactory(
    () => CreateServiceRequestBloc(createServiceRequestUseCase: sl()),
  );

  sl.registerFactory(
    () => ServiceRequestDetailBloc(
      getServiceRequestInfoUseCase: sl(),
      getServiceRequestActivityUseCase: sl(),
    ),
  );

  sl.registerFactory(
    () => ServiceRequestApplicationsBloc(
      getServiceRequestApplicationsUseCase: sl(),
      acceptServiceRequestApplicationUseCase: sl(),
      rejectServiceRequestApplicationUseCase: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => OpenServiceRequestsRemoteDataSource(
      dio: sl<Dio>(instanceName: apiDioInstanceName),
    ),
  );

  sl.registerLazySingleton<FreelancerHomeRepository>(
    () => FreelancerHomeRepositoryImpl(remote: sl()),
  );

  sl.registerLazySingleton(() => GetOpenServiceRequestsUseCase(sl()));

  sl.registerFactory(
    () => FreelancerHomeBloc(getOpenServiceRequestsUseCase: sl()),
  );

  sl.registerLazySingleton(
    () => FreelancerServiceRequestDetailRemoteDataSource(
      dio: sl<Dio>(instanceName: apiDioInstanceName),
    ),
  );

  sl.registerLazySingleton<FreelancerServiceRequestDetailRepository>(
    () => FreelancerServiceRequestDetailRepositoryImpl(remote: sl()),
  );

  sl.registerLazySingleton(() => GetOpenServiceRequestDetailUseCase(sl()));
  sl.registerLazySingleton(() => ApplyToOpenServiceRequestUseCase(sl()));

  sl.registerFactory(
    () => FreelancerServiceRequestDetailBloc(
      getOpenServiceRequestDetailUseCase: sl(),
      applyToOpenServiceRequestUseCase: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => FreelancerMyWorkRemoteDataSource(
      dio: sl<Dio>(instanceName: apiDioInstanceName),
    ),
  );

  sl.registerLazySingleton<FreelancerMyWorkRepository>(
    () => FreelancerMyWorkRepositoryImpl(remote: sl()),
  );

  sl.registerLazySingleton(() => GetFreelancerApplicationsUseCase(sl()));
  sl.registerLazySingleton(() => GetFreelancerJobsUseCase(sl()));

  sl.registerFactory(
    () => FreelancerMyWorkBloc(
      getFreelancerApplicationsUseCase: sl(),
      getFreelancerJobsUseCase: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => ClientPublicProfileRemoteDataSource(
      dio: sl<Dio>(instanceName: apiDioInstanceName),
    ),
  );

  sl.registerLazySingleton<ClientPublicProfileRepository>(
    () => ClientPublicProfileRepositoryImpl(remote: sl()),
  );

  sl.registerLazySingleton(() => GetPublicClientProfileUseCase(sl()));

  sl.registerFactory(
    () => ClientPublicProfileBloc(
      getPublicClientProfileUseCase: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => FreelancerPublicProfileRemoteDataSource(
      dio: sl<Dio>(instanceName: apiDioInstanceName),
    ),
  );

  sl.registerLazySingleton<FreelancerPublicProfileRepository>(
    () => FreelancerPublicProfileRepositoryImpl(remote: sl()),
  );

  sl.registerLazySingleton(() => GetPublicFreelancerProfileUseCase(sl()));

  sl.registerFactory(
    () => FreelancerPublicProfileBloc(
      getPublicFreelancerProfileUseCase: sl(),
    ),
  );
}
