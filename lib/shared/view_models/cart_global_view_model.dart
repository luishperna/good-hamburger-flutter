import 'package:flutter/material.dart';

class CartGlobalViewModel extends ChangeNotifier {
  final List<dynamic> _items = [];

  List<dynamic> get items => _items;

  int get totalItems => _items.length;

  void addItem(dynamic item) {
    _items.add(item);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
