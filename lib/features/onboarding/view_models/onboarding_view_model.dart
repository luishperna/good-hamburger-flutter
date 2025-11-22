import 'package:flutter/material.dart';

import '../../../core/router/app_router.dart';
import '../models/onboarding_item_model.dart';
import '../repositories/onboarding_repository.dart';

class OnboardingViewModel extends ChangeNotifier {
  final OnboardingRepository _repository;

  OnboardingViewModel(this._repository);

  final PageController pageController = PageController();
  int _currentTabIndex = 0;

  List<OnboardingItemModel> get items => const [
    OnboardingItemModel(
      title: 'Delicious Hamburgers',
      description:
          'Juicy meat cooked to perfection, melted cheese, and fresh ingredients. An explosion of flavor in every bite.',
      icon: Icons.fastfood_rounded,
    ),
    OnboardingItemModel(
      title: 'The Perfect Side',
      description:
          "Don't forget the crispy french fries and that ice-cold drink to complete your experience.",
      icon: Icons.lunch_dining_rounded,
    ),
    OnboardingItemModel(
      title: 'Ordering Has Never Been Easier',
      description:
          "Hunger doesn't wait. Choose, customize, and finalize your order in a few seconds, hassle-free.",
      icon: Icons.check_circle_outline_rounded,
    ),
  ];

  int get currentTabIndex => _currentTabIndex;

  bool get isLastPage => _currentTabIndex == items.length - 1;

  void setTabIndex(int index) {
    _currentTabIndex = index;
    notifyListeners();
  }

  void nextTab() {
    if (_currentTabIndex < items.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  Future<void> completeOnboarding(BuildContext context) async {
    await _repository.markOnboardingAsComplete();
    if (context.mounted) {
      Navigator.pushReplacementNamed(context, AppRouter.userIdentification);
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
