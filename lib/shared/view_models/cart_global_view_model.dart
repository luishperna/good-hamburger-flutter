import 'package:flutter/material.dart';

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

  void addItem(ItemModel item) {
    _items.removeWhere((i) => i.id == item.id);
    _items.add(item);
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
