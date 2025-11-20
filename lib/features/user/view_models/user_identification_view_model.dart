import 'package:flutter/material.dart';

import '../../../core/di/injection_container.dart';
import '../../../core/router/app_router.dart';
import '../../../shared/view_models/user_global_view_model.dart';

class UserIdentificationViewModel extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();

  bool _isFormValid = false;

  bool get isFormValid => _isFormValid;

  void validateInput(String value) {
    final isValid = value.trim().length >= 3;
    if (_isFormValid != isValid) {
      _isFormValid = isValid;
      notifyListeners();
    }
  }

  void submit(BuildContext context) {
    if (!_isFormValid) return;

    final name = nameController.text.trim();

    getIt<UserGlobalViewModel>().setUserName(name);

    Navigator.pushReplacementNamed(context, AppRouter.menu);
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}
