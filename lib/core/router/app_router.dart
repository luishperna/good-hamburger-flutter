import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../features/onboarding/view_models/onboarding_view_model.dart';
import '../../features/onboarding/views/onboarding_view.dart';
import '../../features/user/view_models/user_identification_view_model.dart';
import '../../features/user/views/user_identification_view.dart';
import '../di/injection_container.dart';

class AppRouter {
  AppRouter._();

  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String userIdentification = '/user-identification';
  static const String menu = '/menu';
  static const String cart = '/cart';
  static const String orders = '/orders';

  static Map<String, WidgetBuilder> get routes => {
    // splash: (context) => ChangeNotifierProvider(
    //   create: (_) => getIt<SplashViewModel>(),
    //   child: const SplashView(),
    // ),
    onboarding: (context) => ChangeNotifierProvider(
      create: (_) => getIt<OnboardingViewModel>(),
      child: const OnboardingView(),
    ),

    userIdentification: (context) => ChangeNotifierProvider(
      create: (_) => getIt<UserIdentificationViewModel>(),
      child: const UserIdentificationView(),
    ),

    // menu: (context) => ChangeNotifierProvider(
    //   create: (_) => getIt<MenuViewModel>(),
    //   child: const MenuView(),
    // ),

    // cart: (context) => const CartView(),

    // orders: (context) => ChangeNotifierProvider(
    //   create: (_) => getIt<OrdersViewModel>(),
    //   child: const OrdersView(),
    // ),
  };
}
