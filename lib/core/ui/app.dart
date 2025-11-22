import 'package:flutter/material.dart';
import 'package:good_hamburger/core/router/app_router.dart';
import 'package:good_hamburger/core/ui/theme/app_theme.dart';

import '../config/app_config.dart';

class GoodHamburgerApp extends StatelessWidget {
  const GoodHamburgerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConfig.name,
      theme: AppTheme.lightTheme,
      initialRoute: AppRouter.splash,
      routes: AppRouter.routes,
    );
  }
}
