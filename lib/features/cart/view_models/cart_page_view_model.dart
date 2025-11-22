import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../shared/view_models/user_global_view_model.dart';

class CartPageViewModel extends ChangeNotifier {
  bool _isEditingName = false;
  late final TextEditingController nameController;
  final FocusNode nameFocusNode = FocusNode();

  bool get isEditingName => _isEditingName;

  CartPageViewModel() {
    nameController = TextEditingController();
  }

  void startEditing(String currentName, BuildContext context) {
    _isEditingName = true;
    nameController.text = currentName;
    notifyListeners();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(nameFocusNode);
    });
  }

  void saveName(BuildContext context, UserGlobalViewModel userGlobal) {
    final newName = nameController.text.trim();

    if (newName.isEmpty || newName.length < 3) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "Name must have at least 3 characters.",
        ),
      );
      return;
    }

    userGlobal.setUserName(newName);

    _isEditingName = false;
    notifyListeners();

    showTopSnackBar(
      Overlay.of(context),
      const CustomSnackBar.success(message: "Name updated successfully!"),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    nameFocusNode.dispose();
    super.dispose();
  }
}
