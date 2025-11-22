import '../../features/menu/models/category_enum.dart';
import '../../features/menu/models/item_model.dart';

class OrderCalculator {
  int calculateSubtotal(List<ItemModel> items) {
    return items.fold(0, (sum, item) => sum + item.price);
  }

  double calculateDiscountPercentage(List<ItemModel> items) {
    final hasSandwich = items.any((i) => i.category == CategoryEnum.sandwich);
    final hasFries = items.any((i) => i.category == CategoryEnum.fries);
    final hasDrink = items.any((i) => i.category == CategoryEnum.drink);

    if (hasSandwich && hasFries && hasDrink) {
      return 0.20;
    }

    if (hasSandwich && hasDrink) {
      return 0.15;
    }

    if (hasSandwich && hasFries) {
      return 0.10;
    }

    return 0.0;
  }

  int calculateDiscountValue(List<ItemModel> items) {
    final subtotal = calculateSubtotal(items);
    final percentage = calculateDiscountPercentage(items);
    return (subtotal * percentage).round();
  }

  int calculateTotal(List<ItemModel> items) {
    return calculateSubtotal(items) - calculateDiscountValue(items);
  }
}
