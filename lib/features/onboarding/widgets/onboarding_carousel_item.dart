import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/onboarding_item_model.dart';

class OnboardingCarouselItem extends StatelessWidget {
  final OnboardingItemModel item;

  const OnboardingCarouselItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(item.imagePath, height: 300, fit: BoxFit.contain),
          const SizedBox(height: 32),
          Text(
            item.title,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            item.description,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
