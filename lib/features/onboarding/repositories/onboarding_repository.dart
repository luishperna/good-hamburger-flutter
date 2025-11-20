import 'package:good_hamburger/shared/services/local_preferences_service.dart';

class OnboardingRepository {
  final LocalPreferencesService _localPreferencesService;

  static const String _onboardingKey = 'HAS_COMPLETED_ONBOARDING';

  OnboardingRepository(this._localPreferencesService);

  Future<void> markOnboardingAsComplete() async {
    await _localPreferencesService.saveBool(_onboardingKey, true);
  }

  Future<bool> hasCompletedOnboarding() async {
    final result = await _localPreferencesService.getBool(_onboardingKey);
    return result ?? false;
  }
}
