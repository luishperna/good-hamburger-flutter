import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/view_models/cart_global_view_model.dart';
import '../../cart/views/cart_view.dart';
import '../../menu/views/menu_view.dart';
import '../../orders/views/orders_view.dart';
import '../view_models/main_view_model.dart';
import '../widgets/custom_bottom_app_bar.dart';
import '../widgets/menu_floating_action_button.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  static const List<Widget> _views = [OrdersView(), MenuView(), CartView()];

  @override
  Widget build(BuildContext context) {
    final mainViewModel = context.watch<MainViewModel>();
    final cartViewModel = context.watch<CartGlobalViewModel>();

    return Scaffold(
      extendBody: true,

      body: IndexedStack(
        index: mainViewModel.currentTabIndex,
        children: _views,
      ),

      bottomNavigationBar: CustomBottomAppBar(
        currentTabIndex: mainViewModel.currentTabIndex,
        onTabSelected: mainViewModel.setTabIndex,
        cartItemCount: cartViewModel.totalItems,
      ),

      floatingActionButton: MenuFloatingActionButton(
        onPressed: () => mainViewModel.setTabIndex(1),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
