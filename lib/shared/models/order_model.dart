import 'package:good_hamburger/features/orders/models/order_status_enum.dart';

import '../../features/menu/models/item_model.dart';
import 'user_model.dart';

class OrderModel {
  final int id;
  final String code;
  final DateTime date;
  final List<ItemModel> items;
  final int subtotal;
  final int discount;
  final int total;
  final OrderStatusEnum status;
  final UserModel orderedBy;

  const OrderModel({
    required this.id,
    required this.code,
    required this.date,
    required this.items,
    required this.subtotal,
    required this.discount,
    required this.total,
    required this.status,
    required this.orderedBy,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'date': date.toIso8601String(),
      'items': items.map((i) => i.toJson()).toList(),
      'subtotal': subtotal,
      'discount': discount,
      'total': total,
      'status': status.name,
      'orderedBy': orderedBy.toJson(),
    };
  }
}
