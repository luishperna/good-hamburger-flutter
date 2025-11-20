import 'package:flutter/material.dart';
import 'package:good_hamburger/core/router/app_router.dart';

import '../repositories/onboarding_repository.dart';

class OnboardingViewModel extends ChangeNotifier {
  final OnboardingRepository _onboardingRepository;
  final PageController pageController = PageController();

  OnboardingViewModel(this._onboardingRepository);

  int _currentTabIndex = 0;

  int get currentTabIndex => _currentTabIndex;

  void setTabIndex(int index) {
    _currentTabIndex = index;
    notifyListeners();
  }

  void nextTab() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Future<void> completeOnboarding(BuildContext context) async {
    await _onboardingRepository.markOnboardingAsComplete();

    if (!context.mounted) return;
    Navigator.pushReplacementNamed(context, AppRouter.userIdentification);
  }
}
