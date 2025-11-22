import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../shared/utils/extensions/currency_extension.dart';
import '../../../shared/view_models/cart_global_view_model.dart';
import '../../menu/models/item_model.dart';

class ItemDetailsModal extends StatelessWidget {
  final ItemModel item;

  const ItemDetailsModal({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cart = context.watch<CartGlobalViewModel>();
    final quantityInCart = cart.items.where((i) => i.id == item.id).length;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(32),
                  ),
                  child: Image.asset(
                    item.imagePath,
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withValues(alpha: 0.8),
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.black87),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          item.name,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        item.price.toCurrency,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  Text(
                    "About this item",
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.description,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 40),

                  if (quantityInCart > 0)
                    _buildQuantityControls(context, theme, quantityInCart)
                  else
                    _buildAddToCartButton(context, theme),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddToCartButton(BuildContext context, ThemeData theme) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () => _handleAddToCart(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        child: const Text(
          "Add to Cart",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildQuantityControls(
    BuildContext context,
    ThemeData theme,
    int quantity,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Quantity",
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),

        Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove_rounded, color: theme.primaryColor),
                onPressed: () => _handleRemoveFromCart(context),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  quantity.toString(),
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.add_rounded, color: theme.primaryColor),
                onPressed: () => _handleAddToCart(context),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _handleAddToCart(BuildContext context) {
    final cart = context.read<CartGlobalViewModel>();

    try {
      cart.addItem(item);
    } catch (e) {
      final message = e.toString().replaceAll('Exception: ', '');

      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(message: message),
        displayDuration: const Duration(milliseconds: 2500),
      );
    }
  }

  void _handleRemoveFromCart(BuildContext context) {
    final cart = context.read<CartGlobalViewModel>();
    cart.removeItem(item);
  }
}
