import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/onboarding_item_model.dart';
import '../view_models/onboarding_view_model.dart';
import '../widgets/onboarding_carousel_item.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  static const List<OnboardingItemModel> _items = [
    OnboardingItemModel(
      title: 'Delicious Hamburgers',
      description: 'Experience the best taste in town made with love.',
      imagePath: 'assets/images/step1.svg',
    ),
    OnboardingItemModel(
      title: 'Fast Delivery',
      description: 'Get your food delivered hot and fresh to your doorstep.',
      imagePath: 'assets/images/step2.svg',
    ),
    OnboardingItemModel(
      title: 'Easy Payment',
      description: 'Pay easily with our secure payment system.',
      imagePath: 'assets/images/step3.svg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<OnboardingViewModel>();
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: provider.pageController,
              itemCount: _items.length,
              onPageChanged: provider.setTabIndex,
              itemBuilder: (context, index) {
                return OnboardingCarouselItem(item: _items[index]);
              },
            ),

            Positioned(
              top: 20,
              right: 20,
              child: SmoothPageIndicator(
                controller: provider.pageController,
                count: _items.length,
                effect: WormEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: theme.primaryColor,
                  dotColor: Colors.grey.shade300,
                ),
              ),
            ),

            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (provider.currentTabIndex != _items.length - 1)
                    TextButton(
                      onPressed: () => provider.completeOnboarding(context),
                      child: Text(
                        "Skip",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    )
                  else
                    const SizedBox(width: 64),
                  ElevatedButton(
                    onPressed: () {
                      if (provider.currentTabIndex == _items.length - 1) {
                        provider.completeOnboarding(context);
                      } else {
                        provider.nextTab();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                    ),
                    child: Text(
                      provider.currentTabIndex == _items.length - 1
                          ? "Get Started"
                          : "Next",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
