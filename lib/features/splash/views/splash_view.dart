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
    final indicatorColor = theme.colorScheme.primary;
    const String logoPath = 'assets/images/logo.png';

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(logoPath, width: 280, fit: BoxFit.contain),

              const SizedBox(height: 48),

              SizedBox(
                width: 240,
                child: LinearProgressIndicator(
                  color: indicatorColor,
                  backgroundColor: indicatorColor.withValues(alpha: 0.2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
