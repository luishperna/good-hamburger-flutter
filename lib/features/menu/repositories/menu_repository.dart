import '../../../shared/services/api_service.dart';
import '../models/item_model.dart';

class MenuRepository {
  final ApiService _apiService;

  static const String _menuUrl = 'https://api.good-hamburger.com/menu';

  MenuRepository(this._apiService);

  Future<List<ItemModel>> getMenu() async {
    try {
      final response = await _apiService.get(_menuUrl);

      if (response is! List) return [];
      return response
          .cast<Map<String, dynamic>>()
          .map(ItemModel.fromMap)
          .toList();
    } catch (e) {
      throw Exception('Failed to load menu: $e');
    }
  }
}
