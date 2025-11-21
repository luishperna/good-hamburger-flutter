import 'package:flutter/material.dart';
import 'package:good_hamburger/features/orders/models/order_model.dart';

import '../repositories/orders_repository.dart';

class OrdersViewModel extends ChangeNotifier {
  final OrdersRepository _repository;

  OrdersViewModel(this._repository);

  bool _isLoading = false;
  List<OrderModel> _orders = [];

  bool get isLoading => _isLoading;

  List<OrderModel> get orders => _orders;

  Future<void> fetchOrders() async {
    _isLoading = true;
    notifyListeners();

    try {
      _orders = await _repository.getOrders();
      _orders.sort((a, b) => b.date.compareTo(a.date));
    } catch (e) {
      debugPrint("Erro ao buscar pedidos: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
