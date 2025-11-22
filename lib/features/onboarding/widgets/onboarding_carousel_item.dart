import 'package:flutter/material.dart';

import '../models/onboarding_item_model.dart';

class OnboardingCarouselItem extends StatelessWidget {
  final OnboardingItemModel item;

  const OnboardingCarouselItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Spacer(flex: 1),

          Icon(item.icon, size: 180, color: theme.primaryColor),

          const SizedBox(height: 48),

          Text(
            item.title,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.primaryColor,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 16),

          Text(
            item.description,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: Colors.grey[600],
              height: 1.5,
              fontSize: 16,
            ),
          ),

          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
