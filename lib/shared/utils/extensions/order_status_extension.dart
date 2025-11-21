import 'package:flutter/material.dart';

import '../../../features/orders/models/order_status_enum.dart';

extension OrderStatusUiExtension on OrderStatusEnum {
  String get label {
    switch (this) {
      case OrderStatusEnum.preparing:
        return "Preparing";
      case OrderStatusEnum.delivering:
        return "Out for Delivery";
      case OrderStatusEnum.delivered:
        return "Delivered";
      case OrderStatusEnum.canceled:
        return "Canceled";
    }
  }

  Color get color {
    switch (this) {
      case OrderStatusEnum.delivered:
        return Colors.green;
      case OrderStatusEnum.canceled:
        return Colors.red;
      default:
        return Colors.orange;
    }
  }
}
