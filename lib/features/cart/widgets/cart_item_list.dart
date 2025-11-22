import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/utils/extensions/currency_extension.dart';
import '../../../shared/view_models/cart_global_view_model.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartGlobalViewModel>();
    final theme = Theme.of(context);

    return ListView.separated(
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
                    item.price.toCurrency,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              color: Colors.grey,
              onPressed: () =>
                  context.read<CartGlobalViewModel>().removeItem(item),
            ),
          ],
        );
      },
    );
  }
}
