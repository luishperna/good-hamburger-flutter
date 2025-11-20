import 'package:get_it/get_it.dart';

import '../../features/onboarding/repositories/onboarding_repository.dart';
import '../../features/onboarding/view_models/onboarding_view_model.dart';
import '../../shared/services/local_preferences_service.dart';

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
}
