import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../view_models/onboarding_view_model.dart';
import '../widgets/onboarding_carousel_item.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<OnboardingViewModel>();
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            PageView.builder(
              controller: viewModel.pageController,
              itemCount: viewModel.items.length,
              onPageChanged: viewModel.setTabIndex,
              itemBuilder: (context, index) {
                return OnboardingCarouselItem(item: viewModel.items[index]);
              },
            ),

            Positioned(
              bottom: 100,
              child: SmoothPageIndicator(
                controller: viewModel.pageController,
                count: viewModel.items.length,
                effect: WormEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  spacing: 12,
                  activeDotColor: theme.primaryColor,
                  dotColor: Colors.grey.shade300,
                ),
              ),
            ),

            Positioned(
              bottom: 24,
              left: 24,
              right: 24,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: viewModel.isLastPage ? 0.0 : 1.0,
                    child: TextButton(
                      onPressed: viewModel.isLastPage
                          ? null
                          : () => viewModel.completeOnboarding(context),
                      child: Text(
                        "Skip",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      if (viewModel.isLastPage) {
                        viewModel.completeOnboarding(context);
                      } else {
                        viewModel.nextTab();
                      }
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      child: Text(
                        viewModel.isLastPage ? "Get Started" : "Next",
                        style: TextStyle(
                          color: theme.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
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
