
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../features/auth/data/datasources/auth_remote_datasource_impl.dart';
import '../../features/auth/data/repositories_impl/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/get_current_user_use_case.dart';
import '../../features/auth/domain/usecases/is_logged_in_use_case.dart';
import '../../features/auth/domain/usecases/login_use_case.dart';
import '../../features/auth/domain/usecases/logout_use_case.dart';
import '../../features/auth/domain/usecases/register_use_case.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../network/api_provider.dart';

final locator = GetIt.instance;

/// Dependency injection setup
/// Add your dependency injection configuration here
class InjectionContainer {
  /// Initialize dependencies
  static Future<void> init() async {
    // Add your dependency registration here
    // Example:
    // GetIt.instance.registerFactory(() => YourRepository());
    // GetIt.instance.registerLazySingleton(() => YourService());

    // Cubit
    locator.registerFactory<AuthCubit>(
      () => AuthCubit(
        loginUseCase: locator(),
        registerUseCase: locator(),
        isLoggedInUseCase: locator(),
        getCurrentUserUseCase: locator(),
        logoutUseCase: locator(),
      ),
    );

    /// ----------------------------
  /// Use cases
  /// ----------------------------
  locator.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(locator()),
  );
  locator.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(locator()),
  );
  locator.registerLazySingleton<IsLoggedInUseCase>(
    () => IsLoggedInUseCase(locator()),
  );
  locator.registerLazySingleton<GetCurrentUserUseCase>(
    () => GetCurrentUserUseCase(locator()),
  );
  locator.registerLazySingleton<LogoutUseCase>(
    () => LogoutUseCase(locator()),
  );

  /// ----------------------------
  /// Repository
  /// ----------------------------
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remote: locator()),
  );

  /// ----------------------------
  /// Data sources
  /// ----------------------------
  locator.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(locator()),
  );

    /// ----------------------------
  /// External
  /// ----------------------------
  locator.registerLazySingleton<ApiProvider>(
    () => ApiProvider(),
  );
  
  locator.registerLazySingleton<Dio>(
    () => locator<ApiProvider>().dio,
  );

  }
}
