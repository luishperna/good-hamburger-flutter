import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/view_models/cart_global_view_model.dart';
import '../view_models/cart_page_view_model.dart';
import '../widgets/cart_empty_state.dart';
import '../widgets/cart_item_list.dart';
import '../widgets/cart_summary_section.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartPageViewModel(),
      child: const _CartViewBody(),
    );
  }
}

class _CartViewBody extends StatelessWidget {
  const _CartViewBody();

  @override
  Widget build(BuildContext context) {
    final hasItems = context.select<CartGlobalViewModel, bool>(
      (vm) => vm.totalItems > 0,
    );
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        actions: [
          if (hasItems)
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: () => context.read<CartGlobalViewModel>().clearCart(),
              tooltip: 'Clear Cart',
            ),
        ],
      ),
      body: !hasItems
          ? const CartEmptyState()
          : const Column(
              children: [
                Expanded(child: CartItemList()),
                CartSummarySection(),
              ],
            ),
    );
  }
}
