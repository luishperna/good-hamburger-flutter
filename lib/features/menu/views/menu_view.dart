import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/view_models/cart_global_view_model.dart';
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
    final userName = userGlobal.user?.name ?? 'Cliente';

    return Scaffold(
      backgroundColor: Colors.grey[50],
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
                    "Olá, $userName",
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "O que vamos comer hoje?",
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
                                  Text("Carregando itens..."),
                                ],
                              ),
                            )
                          : menu.items.isEmpty
                          ? const Center(
                              child: Text("Nenhum item nesta categoria :("),
                            )
                          : ListView.builder(
                              itemCount: menu.items.length,
                              padding: const EdgeInsets.only(
                                bottom: 20,
                                top: 10,
                              ),
                              itemBuilder: (context, index) {
                                final item = menu.items[index];

                                return ItemCard(
                                  item: item,
                                  onTap: () {
                                    // 1. Acessa o Carrinho (Usamos READ porque é uma ação única, não queremos ouvir mudanças aqui)
                                    final cart = context
                                        .read<CartGlobalViewModel>();

                                    try {
                                      // 2. Tenta adicionar (A lógica de validação está dentro do addItem)
                                      cart.addItem(item);

                                      // 3. Feedback de SUCESSO (Sênior UX)
                                      ScaffoldMessenger.of(
                                        context,
                                      ).hideCurrentSnackBar(); // Limpa anteriores
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            '${item.name} adicionado! 🛒',
                                          ),
                                          backgroundColor: Colors.green[700],
                                          behavior: SnackBarBehavior.floating,
                                          // Fica flutuando, mais moderno
                                          duration: const Duration(seconds: 1),
                                          action: SnackBarAction(
                                            label: 'DESFAZER',
                                            textColor: Colors.white,
                                            onPressed: () =>
                                                cart.removeItem(item),
                                          ),
                                        ),
                                      );
                                    } catch (e) {
                                      // 4. Feedback de ERRO (Regra de Negócio violada)
                                      // Removemos o prefixo "Exception:" pra ficar bonito
                                      final message = e.toString().replaceAll(
                                        'Exception: ',
                                        '',
                                      );

                                      ScaffoldMessenger.of(
                                        context,
                                      ).hideCurrentSnackBar();
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(message),
                                          backgroundColor: Colors.red[700],
                                          behavior: SnackBarBehavior.floating,
                                        ),
                                      );
                                    }
                                  },
                                );
                              },
                            ),
                      // ...
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
