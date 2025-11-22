import '../../../shared/models/order_model.dart';
import '../../../shared/services/api_service.dart';

class CartRepository {
  final ApiService _apiService;

  static const String _ordersUrl = 'https://api.good-hamburger.com/orders';

  CartRepository(this._apiService);

  Future<void> saveOrder(OrderModel order) async {
    try {
      final orderJson = order.toJson();
      await _apiService.post(_ordersUrl, body: orderJson);
    } catch (e) {
      throw Exception('Failed to save order: $e');
    }
  }
}
