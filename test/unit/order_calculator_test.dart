import 'package:flutter_test/flutter_test.dart';
import 'package:good_hamburger/features/menu/models/category_enum.dart';
import 'package:good_hamburger/features/menu/models/item_model.dart';
import 'package:good_hamburger/shared/domain/order_calculator.dart';

void main() {
  late OrderCalculator calculator;

  setUp(() {
    calculator = OrderCalculator();
  });

  final sandwich = const ItemModel(
    id: 1,
    category: CategoryEnum.sandwich,
    name: 'Burger',
    price: 500,
    description: '',
    imagePath: '',
  );
  final fries = const ItemModel(
    id: 2,
    category: CategoryEnum.fries,
    name: 'Fries',
    price: 200,
    description: '',
    imagePath: '',
  );
  final drink = const ItemModel(
    id: 3,
    category: CategoryEnum.drink,
    name: 'Soft Drink',
    price: 250,
    description: '',
    imagePath: '',
  );
  final extraSauce = const ItemModel(
    id: 4,
    category: CategoryEnum.extras,
    name: 'Extra Sauce',
    price: 50,
    description: '',
    imagePath: '',
  );

  group('OrderCalculator - Discount Rules', () {
    test(
      'Should apply 20% discount for the full combo (Sandwich + Fries + Drink)',
      () {
        final items = [sandwich, fries, drink];

        expect(calculator.calculateSubtotal(items), 950); // 500 + 200 + 250
        expect(calculator.calculateDiscountPercentage(items), 0.20);
        expect(calculator.calculateDiscountValue(items), 190); // 950 * 0.20
        expect(calculator.calculateTotal(items), 760); // 950 - 190
      },
    );

    test('Should apply 15% discount for Sandwich + Drink', () {
      final items = [sandwich, drink];

      expect(calculator.calculateSubtotal(items), 750);
      expect(calculator.calculateDiscountPercentage(items), 0.15);
      expect(
        calculator.calculateDiscountValue(items),
        113,
      ); // 750 * 0.15 = 112.5 ~ 113
      expect(calculator.calculateTotal(items), 637); // 750 - 113
    });

    test('Should apply 10% discount for Sandwich + Fries', () {
      final items = [sandwich, fries];

      expect(calculator.calculateSubtotal(items), 700); // 500 + 200
      expect(calculator.calculateDiscountPercentage(items), 0.10);
      expect(calculator.calculateDiscountValue(items), 70); // 700 * 0.10
      expect(calculator.calculateTotal(items), 630); // 700 - 70
    });

    test('Should not apply discount if there is no sandwich', () {
      final items = [fries, drink, extraSauce];

      expect(calculator.calculateSubtotal(items), 500);
      expect(calculator.calculateDiscountPercentage(items), 0.0);
      expect(calculator.calculateDiscountValue(items), 0);
      expect(calculator.calculateTotal(items), 500);
    });

    test('Should not apply discount for only one sandwich', () {
      final items = [sandwich];

      expect(calculator.calculateDiscountPercentage(items), 0.0);
      expect(calculator.calculateTotal(items), 500);
    });

    test('Should maintain 20% discount even with additional extra items', () {
      final items = [sandwich, fries, drink, extraSauce];

      expect(calculator.calculateDiscountPercentage(items), 0.20);
      // Subtotal: 950 + 50 = 1000
      // Discount: 1000 * 0.20 = 200
      // Total: 800
      expect(calculator.calculateTotal(items), 800);
    });
  });
}
