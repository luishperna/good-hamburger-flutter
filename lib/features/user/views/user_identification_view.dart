import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/user_identification_view_model.dart';

class UserIdentificationView extends StatelessWidget {
  const UserIdentificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<UserIdentificationViewModel>();
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    Icons.fastfood_rounded,
                    size: 64,
                    color: theme.primaryColor,
                  ),
                  const SizedBox(height: 32),

                  Text(
                    "Welcome!",
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Tell us your name to start ordering.",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),

                  TextField(
                    controller: viewModel.nameController,
                    onChanged: viewModel.validateInput,
                    decoration: InputDecoration(
                      labelText: "Your Name",
                      hintText: "Ex: John Doe",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.person_outline),
                      filled: true,
                      fillColor: Colors.grey[50],
                    ),
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => viewModel.submit(context),
                  ),
                  const SizedBox(height: 24),

                  Selector<UserIdentificationViewModel, bool>(
                    selector: (_, vm) => vm.isFormValid,
                    builder: (context, isValid, child) {
                      return ElevatedButton(
                        onPressed: isValid
                            ? () => viewModel.submit(context)
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.primaryColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
