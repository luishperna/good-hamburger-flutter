import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/view_models/user_global_view_model.dart';
import '../view_models/cart_page_view_model.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final userGlobal = context.watch<UserGlobalViewModel>();
    final pageViewModel = context.watch<CartPageViewModel>();

    final currentUserName = userGlobal.user?.name;
    final hasName = currentUserName != null && currentUserName.isNotEmpty;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.person_outline, color: Colors.grey),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Order for:",
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 10,
                    color: Colors.grey[600],
                  ),
                ),
                pageViewModel.isEditingName
                    ? TextField(
                        controller: pageViewModel.nameController,
                        focusNode: pageViewModel.nameFocusNode,
                        decoration: const InputDecoration(
                          hintText: "Enter your name",
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 4),
                          border: InputBorder.none,
                        ),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        onSubmitted: (_) =>
                            pageViewModel.saveName(context, userGlobal),
                      )
                    : Text(
                        hasName ? currentUserName! : "Enter your name",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: hasName ? Colors.black87 : Colors.grey[500],
                        ),
                      ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              pageViewModel.isEditingName ? Icons.check_circle : Icons.edit,
              color: theme.primaryColor,
            ),
            onPressed: () {
              if (pageViewModel.isEditingName) {
                pageViewModel.saveName(context, userGlobal);
              } else {
                pageViewModel.startEditing(currentUserName ?? "", context);
              }
            },
          ),
        ],
      ),
    );
  }
}
