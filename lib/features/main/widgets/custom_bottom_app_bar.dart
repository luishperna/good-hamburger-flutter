import 'package:flutter/material.dart';

import '../models/bottom_nav_data_model.dart';
import 'bottom_nav_item.dart';

class CustomBottomAppBar extends StatelessWidget {
  final int currentTabIndex;
  final Function(int) onTabSelected;
  final int cartItemCount;

  const CustomBottomAppBar({
    super.key,
    required this.currentTabIndex,
    required this.onTabSelected,
    this.cartItemCount = 0,
  });

  static const List<BottomNavDataModel> _navItemsData = [
    BottomNavDataModel(
      icon: Icons.receipt_long_outlined,
      selectedIcon: Icons.receipt_long,
      label: 'Orders',
    ),

    BottomNavDataModel(
      icon: Icons.shopping_cart_outlined,
      selectedIcon: Icons.shopping_cart,
      label: 'Cart',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10.0,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 16,
      shadowColor: Colors.black.withValues(alpha: 0.15),
      padding: EdgeInsets.zero,
      height: 64,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNavItem(
              bottomNavData: _navItemsData[0],
              isSelected: currentTabIndex == 0,
              onTap: () => onTabSelected(0),
            ),

            const SizedBox(width: 40),

            BottomNavItem(
              bottomNavData: _navItemsData[1],
              isSelected: currentTabIndex == 2,
              onTap: () => onTabSelected(2),
              overrideBadgeCount: cartItemCount,
            ),
          ],
        ),
      ),
    );
  }
}
