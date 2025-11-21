import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../features/main/view_models/main_view_model.dart';
import '../../features/main/views/main_view.dart';
import '../../features/menu/view_models/menu_view_model.dart';
import '../../features/onboarding/view_models/onboarding_view_model.dart';
import '../../features/onboarding/views/onboarding_view.dart';
import '../../features/splash/view_models/splash_view_model.dart';
import '../../features/splash/views/splash_view.dart';
import '../../features/user/view_models/user_identification_view_model.dart';
import '../../features/user/views/user_identification_view.dart';
import '../di/injection_container.dart';

class AppRouter {
  AppRouter._();

  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String userIdentification = '/user-identification';
  static const String main = '/main';

  static Map<String, WidgetBuilder> get routes => {
    splash: (context) => ChangeNotifierProvider(
      create: (_) => getIt<SplashViewModel>(),
      child: const SplashView(),
    ),

    onboarding: (context) => ChangeNotifierProvider(
      create: (_) => getIt<OnboardingViewModel>(),
      child: const OnboardingView(),
    ),

    userIdentification: (context) => ChangeNotifierProvider(
      create: (_) => getIt<UserIdentificationViewModel>(),
      child: const UserIdentificationView(),
    ),

    main: (context) => MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<MainViewModel>()),

        // ChangeNotifierProvider(create: (_) => getIt<CartViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<MenuViewModel>()),

        // ChangeNotifierProvider(create: (_) => getIt<OrdersViewModel>()),
      ],
      child: const MainView(),
    ),
  };
}
