import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../main/models/main_tab_enum.dart';
import '../../main/view_models/main_view_model.dart';

class CartEmptyState extends StatelessWidget {
  const CartEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey[300]),
          const SizedBox(height: 16),
          Text(
            "Your cart is empty",
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {
              context.read<MainViewModel>().setTabIndex(MainTabEnum.menu.index);
            },
            child: const Text("Go to Menu"),
          ),
        ],
      ),
    );
  }
}
