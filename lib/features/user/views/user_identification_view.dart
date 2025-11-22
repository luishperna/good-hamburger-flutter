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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    Icons.account_circle_rounded,
                    size: 80,
                    color: theme.primaryColor.withValues(alpha: 0.8),
                  ),
                  const SizedBox(height: 32),

                  Text(
                    "What's your name?",
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Enter the name that will be used for your orders.",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),

                  TextField(
                    controller: viewModel.nameController,
                    onChanged: viewModel.validateInput,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "Your Name",
                      hintText: "Ex: John Doe",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: theme.primaryColor,
                          width: 2,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: Colors.grey[600],
                      ),
                      filled: true,
                      fillColor: Colors.grey[50],
                      helperText: "Minimum of 3 characters",
                    ),
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => viewModel.submit(context),
                  ),
                  const SizedBox(height: 32),

                  Selector<UserIdentificationViewModel, bool>(
                    selector: (_, vm) => vm.isFormValid,
                    builder: (context, isValid, child) {
                      return SizedBox(
                        height: 56,
                        child: ElevatedButton(
                          onPressed: isValid
                              ? () => viewModel.submit(context)
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.primaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 0,
                            splashFactory: isValid
                                ? InkRipple.splashFactory
                                : NoSplash.splashFactory,
                          ),
                          child: const Text(
                            "Save Name",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
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
