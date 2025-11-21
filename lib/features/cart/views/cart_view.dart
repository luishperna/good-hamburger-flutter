import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/router/app_router.dart';
import '../../../shared/utils/extensions/currency_extension.dart';
import '../../../shared/view_models/cart_global_view_model.dart';
import '../../../shared/view_models/user_global_view_model.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartGlobalViewModel>();
    final userGlobal = context.watch<UserGlobalViewModel>();
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Meu Carrinho'),
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        actions: [
          if (cart.totalItems > 0)
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: () => cart.clearCart(),
              tooltip: 'Limpar Carrinho',
            ),
        ],
      ),

      body: cart.totalItems == 0
          ? _buildEmptyState(context)
          : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(20),
                    itemCount: cart.items.length,
                    separatorBuilder: (_, __) => const Divider(height: 32),
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      return Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              item.imagePath,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 16),
                          // Dados do Item
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  item.price.toCurrency, // Extension!
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Botão Remover Individual
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            color: Colors.grey,
                            onPressed: () => cart.removeItem(item),
                          ),
                        ],
                      );
                    },
                  ),
                ),

                // --- ÁREA INFERIOR (SOMBRA E TOTAIS) ---
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // 1. SEÇÃO DO USUÁRIO
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.person_outline,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pedido para:",
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      fontSize: 10,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  Text(
                                    userGlobal.user?.name ?? "Informe seu nome",
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Botão de Editar Nome
                            IconButton(
                              icon: Icon(Icons.edit, color: theme.primaryColor),
                              onPressed: () {
                                // Navega para UserIdentificationView
                                Navigator.pushNamed(
                                  context,
                                  AppRouter.userIdentification,
                                );
                              },
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      // 2. TOTAIS FINANCEIROS
                      _buildSummaryRow("Subtotal", cart.subtotal.toCurrency),

                      if (cart.discountValue > 0) ...[
                        const SizedBox(height: 8),
                        _buildSummaryRow(
                          "Desconto",
                          "- ${cart.discountValue.toCurrency}",
                          isDiscount: true,
                        ),
                      ],

                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Divider(),
                      ),

                      _buildSummaryRow(
                        "Total",
                        cart.total.toCurrency,
                        isBold: true,
                      ),

                      const SizedBox(height: 24),

                      // 3. BOTÃO DE FINALIZAR
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: cart.totalItems == 0
                              ? null // Desabilita se vazio
                              : () => _submitOrder(context, cart, userGlobal),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.primaryColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "Enviar Pedido", //
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  // Widget Auxiliar para Linhas de Resumo
  Widget _buildSummaryRow(
    String label,
    String value, {
    bool isBold = false,
    bool isDiscount = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isBold ? 18 : 14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: isDiscount ? Colors.red : Colors.black87,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isBold ? 18 : 14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: isDiscount ? Colors.red : Colors.black87,
          ),
        ),
      ],
    );
  }

  // Estado Vazio
  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey[300]),
          const SizedBox(height: 16),
          Text(
            "Seu carrinho está vazio",
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {
              // Volta para a aba de Menu (via MainViewModel se necessário)
              // Ou apenas avisa o usuário para clicar na aba Menu
            },
            child: const Text("Ir para o Menu"),
          ),
        ],
      ),
    );
  }

  // Ação de Enviar
  void _submitOrder(
    BuildContext context,
    CartGlobalViewModel cart,
    UserGlobalViewModel user,
  ) {
    if (!user.isUserIdentified) {
      // Segurança extra: Se não tiver nome, manda pra identificação
      Navigator.pushNamed(context, AppRouter.userIdentification);
      return;
    }

    // TODO: Aqui você chamará o OrdersViewModel para salvar o pedido
    // Por enquanto, apenas mostra um sucesso
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pedido enviado com sucesso!')),
    );
    cart.clearCart();
  }
}
