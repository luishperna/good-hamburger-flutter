import '../../../shared/models/order_model.dart';
import '../../../shared/models/user_model.dart';
import '../../menu/models/category_enum.dart';
import '../../menu/models/item_model.dart';
import '../models/order_status_enum.dart';

class OrdersRepository {
  Future<List<OrderModel>> getOrders() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      OrderModel(
        id: 1,
        code: '2345',
        date: DateTime(2025, 11, 20, 19, 30),
        items: [
          ItemModel(
            id: 1,
            category: CategoryEnum.sandwich,
            name: 'Burger',
            description: 'A classic, juicy beef burger served on a fresh bun.',
            price: 500,
            imagePath: 'assets/mocks/images/menu/item_1.jpg',
          ),
        ],
        subtotal: 500,
        discount: 0,
        total: 500,
        status: OrderStatusEnum.preparing,
        orderedBy: UserModel(name: 'Luís'),
      ),

      OrderModel(
        id: 2,
        code: '2346',
        date: DateTime(2025, 11, 21, 12, 15),
        items: const [
          ItemModel(
            id: 2,
            category: CategoryEnum.sandwich,
            name: 'Burger',
            description: 'A classic, juicy beef burger served on a fresh bun.',
            price: 500,
            imagePath: 'assets/mocks/images/menu/item_1.jpg',
          ),
          ItemModel(
            id: 4,
            category: CategoryEnum.fries,
            name: 'Fries',
            description: 'Crispy golden french fries, perfect as a side',
            price: 200,
            imagePath: 'assets/mocks/images/menu/item_4.jpg',
          ),
        ],
        subtotal: 700,
        discount: 70,
        total: 630,
        status: OrderStatusEnum.delivered,
        orderedBy: UserModel(name: 'Perna'),
      ),
    ];
  }
}
