import 'package:flutter/material.dart';
import 'package:good_hamburger/features/onboarding/view/onboarding_view.dart';
import 'package:good_hamburger/features/onboarding/view_models/onboarding_view_model.dart';
import 'package:provider/provider.dart';

import 'core/di/injection_container.dart';

void main() {
  setupDependencies();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<OnboardingViewModel>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const OnboardingView(),
    );
  }
}
