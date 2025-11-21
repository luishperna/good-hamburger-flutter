import 'package:good_hamburger/features/orders/models/order_status_enum.dart';

import '../../menu/models/item_model.dart';

class OrderModel {
  final int id;
  final String code;
  final DateTime date;
  final List<ItemModel> items;
  final int subtotal;
  final int discount;
  final int total;
  final OrderStatusEnum status;

  const OrderModel({
    required this.id,
    required this.code,
    required this.date,
    required this.items,
    required this.subtotal,
    required this.discount,
    required this.total,
    required this.status,
  });
}
