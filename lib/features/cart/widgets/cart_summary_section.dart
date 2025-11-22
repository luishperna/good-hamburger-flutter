import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../shared/utils/extensions/currency_extension.dart';
import '../../../shared/view_models/cart_global_view_model.dart';
import '../../../shared/view_models/user_global_view_model.dart';
import '../view_models/cart_page_view_model.dart';
import 'user_info_card.dart';

class CartSummarySection extends StatelessWidget {
  const CartSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartGlobalViewModel>();
    final userGlobal = context.watch<UserGlobalViewModel>();
    final isEditing = context.select<CartPageViewModel, bool>(
      (vm) => vm.isEditingName,
    );
    final theme = Theme.of(context);
    final hasName = userGlobal.isUserIdentified;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
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
          const UserInfoCard(),
          const SizedBox(height: 24),

          _buildSummaryRow("Subtotal", cart.subtotal.toCurrency),
          if (cart.discountValue > 0) ...[
            const SizedBox(height: 8),
            _buildSummaryRow(
              "Discount",
              "- ${cart.discountValue.toCurrency}",
              isDiscount: true,
            ),
          ],
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(),
          ),
          _buildSummaryRow("Total", cart.total.toCurrency, isBold: true),
          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (cart.totalItems == 0 || !hasName)
                  ? null
                  : () => _submitOrder(context, cart, userGlobal),
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                disabledBackgroundColor: Colors.grey[300],
                disabledForegroundColor: Colors.grey[600],
              ),
              child: const Text(
                "Submit Order",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 120),
          if (cart.totalItems > 0 && !hasName && !isEditing)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "Please enter your name to finish.",
                style: theme.textTheme.bodySmall?.copyWith(
                  color: Colors.red[700],
                ),
              ),
            ),
        ],
      ),
    );
  }

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

  void _submitOrder(
    BuildContext context,
    CartGlobalViewModel cart,
    UserGlobalViewModel user,
  ) {
    if (!user.isUserIdentified) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "Please enter your name before submitting.",
        ),
      );
      return;
    }

    showTopSnackBar(
      Overlay.of(context),
      const CustomSnackBar.success(message: "Order submitted successfully!"),
    );
    cart.clearCart();
  }
}
