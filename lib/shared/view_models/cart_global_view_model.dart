import 'package:flutter/material.dart';

import '../../features/menu/models/category_enum.dart';
import '../../features/menu/models/item_model.dart';
import '../domain/order_calculator.dart';

class CartGlobalViewModel extends ChangeNotifier {
  final OrderCalculator _calculator;

  CartGlobalViewModel(this._calculator);

  final List<ItemModel> _items = [];

  List<ItemModel> get items => List.unmodifiable(_items);

  int get totalItems => _items.length;

  int get subtotal => _calculator.calculateSubtotal(_items);

  double get discountPercentage =>
      _calculator.calculateDiscountPercentage(_items);

  int get discountValue => _calculator.calculateDiscountValue(_items);

  int get total => _calculator.calculateTotal(_items);

  void addItem(ItemModel newItem) {
    // 1. Verifica se já existe algum item na lista com a mesma categoria do novo item.
    final exists = _items.any(
      (existingItem) => existingItem.category == newItem.category,
    );

    if (exists) {
      String categoryName;
      switch (newItem.category) {
        case CategoryEnum.sandwich:
          categoryName = "one sandwich";
          break;
        case CategoryEnum.fries:
          categoryName = "one portion of fries";
          break;
        case CategoryEnum.drink:
          categoryName = "one drink";
          break;
        case CategoryEnum.extras:
          categoryName = "one item from this category";
          break;
      }
      throw Exception("You can only add $categoryName per order.");
    }

    _items.add(newItem);
    notifyListeners();
  }

  void removeItem(ItemModel item) {
    _items.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
