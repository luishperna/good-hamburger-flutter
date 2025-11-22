import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/view_models/user_global_view_model.dart';
import '../view_models/menu_view_model.dart';
import '../widgets/item_card.dart';
import '../widgets/menu_filter_sidebar.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MenuViewModel>().fetchMenu();
    });
  }

  @override
  Widget build(BuildContext context) {
    final userGlobal = context.watch<UserGlobalViewModel>();
    final menu = context.watch<MenuViewModel>();
    final theme = Theme.of(context);
    final userName = userGlobal.user?.name ?? 'Guest';

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello, $userName",
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "What are we eating today?",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MenuFilterSidebar(
                    selectedCategory: menu.selectedCategory,
                    onCategorySelected: (category) {
                      context.read<MenuViewModel>().setCategoryFilter(category);
                    },
                  ),

                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: menu.isLoading
                          ? const Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircularProgressIndicator(),
                                  SizedBox(height: 16),
                                  Text("Loading items..."),
                                ],
                              ),
                            )
                          : menu.items.isEmpty
                          ? const Center(
                              child: Text("No items found in this category :("),
                            )
                          : ListView.builder(
                              itemCount: menu.items.length,
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 100),
                              itemBuilder: (context, index) {
                                final item = menu.items[index];

                                return ItemCard(item: item);
                              },
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
