import 'package:flutter/material.dart';

import '../models/bottom_nav_data_model.dart';

class BottomNavItem extends StatelessWidget {
  final BottomNavDataModel bottomNavData;

  final bool isSelected;
  final VoidCallback onTap;

  final int? overrideBadgeCount;

  const BottomNavItem({
    super.key,
    required this.bottomNavData,
    required this.isSelected,
    required this.onTap,
    this.overrideBadgeCount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = isSelected ? theme.primaryColor : Colors.grey[400];

    final iconToShow = isSelected
        ? bottomNavData.selectedIcon
        : bottomNavData.icon;
    final currentBadgeCount = overrideBadgeCount ?? bottomNavData.badgeCount;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 16 : 12,
          vertical: 8,
        ),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            currentBadgeCount > 0
                ? Badge(
                    label: Text(currentBadgeCount.toString()),
                    backgroundColor: Colors.redAccent,
                    smallSize: 10,
                    child: Icon(iconToShow, color: color, size: 26),
                  )
                : Icon(iconToShow, color: color, size: 26),

            AnimatedSize(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: SizedBox(
                width: isSelected ? null : 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    bottomNavData.label,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
