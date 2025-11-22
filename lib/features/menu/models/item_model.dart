import 'package:good_hamburger/features/menu/models/category_enum.dart';

class ItemModel {
  final int id;
  final CategoryEnum category;
  final String name;
  final String description;
  final int price;
  final String imagePath;

  const ItemModel({
    required this.id,
    required this.category,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });

  factory ItemModel.fromMap(Map<String, dynamic> item) {
    return ItemModel(
      id: item['id'] as int,
      name: item['name'] as String,
      description: item['description'] as String,
      price: item['price'] as int,
      imagePath: item['imagePath'] as String,
      category: CategoryEnum.values.firstWhere(
        (e) => e.name == item['category'],
        orElse: () => CategoryEnum.extras,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category.name,
      'name': name,
      'description': description,
      'price': price,
      'imagePath': imagePath,
    };
  }
}
