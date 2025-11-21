import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../cart/views/cart_view.dart';
import '../../menu/views/menu_view.dart';
import '../../orders/views/orders_view.dart';
import '../view_models/main_view_model.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    final theme = Theme.of(context);

    final List<Widget> _views = const [OrdersView(), MenuView(), CartView()];

    return Scaffold(
      body: IndexedStack(index: viewModel.currentTabIndex, children: _views),

      bottomNavigationBar: NavigationBar(
        selectedIndex: viewModel.currentTabIndex,
        onDestinationSelected: viewModel.setTabIndex,
        backgroundColor: Colors.white,
        indicatorColor: theme.primaryColor.withValues(alpha: 0.2),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined),
            selectedIcon: Icon(Icons.fastfood),
            label: 'Pedidos',
          ),
          NavigationDestination(
            icon: Icon(Icons.fastfood_outlined),
            selectedIcon: Icon(Icons.receipt_long),
            label: 'Menu',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            selectedIcon: Icon(Icons.person),
            label: 'Carrinho',
          ),
        ],
      ),
    );
  }
}
