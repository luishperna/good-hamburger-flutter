import '../../menu/models/category_enum.dart';
import '../../menu/models/item_model.dart';
import '../models/order_model.dart';
import '../models/order_status_enum.dart';

class OrdersRepository {
  Future<List<OrderModel>> getOrders() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      OrderModel(
        id: 1,
        code: '#1234',
        date: DateTime(2025, 11, 20, 19, 30),
        items: [
          ItemModel(
            id: 1,
            category: CategoryEnum.sandwich,
            name: 'X-Bacon',
            description: '',
            price: 2590,
            imagePath: 'assets/images/burger1.png',
          ),
          ItemModel(
            id: 4,
            category: CategoryEnum.extras,
            name: 'Coca-Cola',
            description: '',
            price: 700,
            imagePath: 'assets/images/soda.png',
          ),
          ItemModel(
            id: 5,
            category: CategoryEnum.extras,
            name: 'Fritas',
            description: '',
            price: 1500,
            imagePath: 'assets/images/fries.png',
          ),
        ],
        subtotal: 4790,
        discount: 958,
        total: 3832,
        status: OrderStatusEnum.delivered,
      ),

      OrderModel(
        id: 2,
        code: '#1235',
        date: DateTime(2025, 11, 21, 12, 15),
        items: const [
          ItemModel(
            id: 2,
            category: CategoryEnum.sandwich,
            name: 'Veggie',
            description: '',
            price: 2200,
            imagePath: 'assets/images/burger2.png',
          ),
        ],
        subtotal: 2200,
        discount: 0,
        total: 2200,
        status: OrderStatusEnum.preparing,
      ),
    ];
  }
}
