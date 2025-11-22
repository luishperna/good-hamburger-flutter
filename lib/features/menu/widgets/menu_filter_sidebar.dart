import 'package:flutter/material.dart';

import '../models/category_enum.dart';

class MenuFilterSidebar extends StatelessWidget {
  final CategoryEnum? selectedCategory;
  final Function(CategoryEnum?) onCategorySelected;

  const MenuFilterSidebar({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildFilterIcon(context, null, Icons.restaurant_menu_rounded, "All"),
          const SizedBox(height: 32),
          _buildFilterIcon(
            context,
            CategoryEnum.sandwich,
            Icons.lunch_dining_rounded,
            "Sandwiches",
          ),
          const SizedBox(height: 32),
          _buildFilterIcon(
            context,
            CategoryEnum.extras,
            Icons.local_drink_rounded,
            "Extras",
          ),
        ],
      ),
    );
  }

  Widget _buildFilterIcon(
    BuildContext context,
    CategoryEnum? category,
    IconData icon,
    String tooltip,
  ) {
    final isSelected = selectedCategory == category;
    final theme = Theme.of(context);
    final color = isSelected ? theme.primaryColor : Colors.grey[400];

    return GestureDetector(
      onTap: () => onCategorySelected(category),
      behavior: HitTestBehavior.opaque,
      child: Tooltip(
        message: tooltip,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(vertical: 12),
          width: double.infinity,
          decoration: BoxDecoration(
            border: isSelected
                ? Border(right: BorderSide(color: theme.primaryColor, width: 3))
                : const Border(
                    right: BorderSide(color: Colors.transparent, width: 3),
                  ),
          ),
          child: Column(
            children: [
              AnimatedScale(
                scale: isSelected ? 1.1 : 1.0,
                duration: const Duration(milliseconds: 300),
                child: Icon(icon, color: color, size: 28),
              ),

              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                child: SizedBox(
                  height: isSelected ? null : 0,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      tooltip,
                      style: TextStyle(
                        color: color,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
