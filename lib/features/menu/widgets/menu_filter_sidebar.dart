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
      width: 60,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildFilterItem(context, null, "Todos"),
          const SizedBox(height: 16),
          _buildFilterItem(context, CategoryEnum.sandwich, "Lanches"),
          const SizedBox(height: 16),
          _buildFilterItem(context, CategoryEnum.extras, "Extras"),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildFilterItem(
    BuildContext context,
    CategoryEnum? category,
    String label,
  ) {
    final isSelected = selectedCategory == category;
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => onCategorySelected(category),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 24),
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: isSelected
              ? Border(left: BorderSide(color: theme.primaryColor, width: 4))
              : const Border(
                  left: BorderSide(color: Colors.transparent, width: 4),
                ),
        ),
        child: RotatedBox(
          quarterTurns: 3,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: theme.textTheme.labelLarge?.copyWith(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? theme.primaryColor : Colors.grey[400],
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
