import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashViewModel>().initApp(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.fastfood_rounded,
              size: 100,
              color: theme.colorScheme.onPrimary,
            ),
            const SizedBox(height: 32),

            CircularProgressIndicator(color: theme.colorScheme.onPrimary),
          ],
        ),
      ),
    );
  }
}
