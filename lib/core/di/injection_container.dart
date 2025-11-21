import 'package:get_it/get_it.dart';
import 'package:good_hamburger/shared/domain/order_calculator.dart';

import '../../features/main/view_models/main_view_model.dart';
import '../../features/menu/repositories/menu_repository.dart';
import '../../features/menu/view_models/menu_view_model.dart';
import '../../features/onboarding/repositories/onboarding_repository.dart';
import '../../features/onboarding/view_models/onboarding_view_model.dart';
import '../../features/orders/repositories/orders_repository.dart';
import '../../features/orders/view_models/orders_view_model.dart';
import '../../features/splash/view_models/splash_view_model.dart';
import '../../features/user/repositories/user_repository.dart';
import '../../features/user/view_models/user_identification_view_model.dart';
import '../../shared/services/api_service.dart';
import '../../shared/services/local_preferences_service.dart';
import '../../shared/view_models/cart_global_view_model.dart';
import '../../shared/view_models/user_global_view_model.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<LocalPreferencesService>(
    () => LocalPreferencesService(),
  );

  getIt.registerLazySingleton<ApiService>(() => ApiService());

  getIt.registerFactory<SplashViewModel>(() => SplashViewModel());

  getIt.registerFactory<OnboardingRepository>(
    () => OnboardingRepository(getIt<LocalPreferencesService>()),
  );

  getIt.registerFactory<OnboardingViewModel>(
    () => OnboardingViewModel(getIt<OnboardingRepository>()),
  );

  getIt.registerFactory<UserRepository>(
    () => UserRepository(getIt<LocalPreferencesService>()),
  );

  getIt.registerLazySingleton<UserGlobalViewModel>(
    () => UserGlobalViewModel(getIt<UserRepository>()),
  );

  getIt.registerFactory<UserIdentificationViewModel>(
    () => UserIdentificationViewModel(),
  );

  getIt.registerFactory<MainViewModel>(() => MainViewModel());

  getIt.registerFactory<MenuRepository>(
    () => MenuRepository(getIt<ApiService>()),
  );

  getIt.registerFactory<MenuViewModel>(
    () => MenuViewModel(getIt<MenuRepository>()),
  );

  getIt.registerFactory<OrderCalculator>(() => OrderCalculator());

  getIt.registerLazySingleton<CartGlobalViewModel>(
    () => CartGlobalViewModel(getIt<OrderCalculator>()),
  );

  getIt.registerFactory<OrdersRepository>(() => OrdersRepository());

  getIt.registerFactory<OrdersViewModel>(
    () => OrdersViewModel(getIt<OrdersRepository>()),
  );
}
