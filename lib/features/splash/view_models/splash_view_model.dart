import 'package:flutter/material.dart';

import '../../../core/di/injection_container.dart';
import '../../../core/router/app_router.dart';
import '../../../shared/view_models/user_global_view_model.dart';

class SplashViewModel extends ChangeNotifier {
  Future<void> initApp(BuildContext context) async {
    final minDelay = Future.delayed(const Duration(seconds: 2));
    final userGlobal = getIt<UserGlobalViewModel>();
    final userNameLoaded = userGlobal.loadUserName();

    await Future.wait([minDelay, userNameLoaded]);

    if (!context.mounted) return;

    final String routeName = userGlobal.isUserIdentified
        ? AppRouter.main
        : AppRouter.onboarding;
    Navigator.pushReplacementNamed(context, routeName);
  }
}
