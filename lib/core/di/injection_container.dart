import 'package:get_it/get_it.dart';

import '../../features/onboarding/repositories/onboarding_repository.dart';
import '../../features/onboarding/view_models/onboarding_view_model.dart';
import '../../features/user/repositories/user_repository.dart';
import '../../features/user/view_models/user_identification_view_model.dart';
import '../../shared/services/local_preferences_service.dart';
import '../../shared/view_models/cart_global_view_model.dart';
import '../../shared/view_models/user_global_view_model.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<LocalPreferencesService>(
    () => LocalPreferencesService(),
  );

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

  getIt.registerLazySingleton<CartGlobalViewModel>(() => CartGlobalViewModel());
}
