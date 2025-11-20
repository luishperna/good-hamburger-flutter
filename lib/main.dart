import 'package:flutter/material.dart';
import 'package:good_hamburger/shared/view_models/cart_global_view_model.dart';
import 'package:good_hamburger/shared/view_models/user_global_view_model.dart';
import 'package:provider/provider.dart';

import 'core/di/injection_container.dart';
import 'core/ui/app.dart';

void main() {
  setupDependencies();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<UserGlobalViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<CartGlobalViewModel>()),
      ],
      child: const GoodHamburgerApp(),
    ),
  );
}
