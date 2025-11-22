import 'package:flutter/material.dart';
import 'package:good_hamburger/shared/utils/extensions/category_ui_extension.dart';

import '../models/category_enum.dart';
import '../models/item_model.dart';
import '../repositories/menu_repository.dart';

class MenuViewModel extends ChangeNotifier {
  final MenuRepository _repository;

  MenuViewModel(this._repository);

  bool _isLoading = false;

  List<ItemModel> _allItems = [];

  List<ItemModel> _filteredItems = [];

  CategoryEnum? _selectedCategory;

  bool get isLoading => _isLoading;

  List<ItemModel> get items => _filteredItems;

  CategoryEnum? get selectedCategory => _selectedCategory;

  Future<void> fetchMenu() async {
    _isLoading = true;
    notifyListeners();

    try {
      _allItems = await _repository.getMenu();
      _filterItems();
    } catch (e) {
      debugPrint("Erro: $e");
      _allItems = [];
      _filteredItems = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void setCategoryFilter(CategoryEnum? category) {
    if (_selectedCategory == category) return;
    _selectedCategory = category;
    _filterItems();
    notifyListeners();
  }

  void _filterItems() {
    if (_selectedCategory == null) {
      _filteredItems = List.from(_allItems);
      return;
    }

    _filteredItems = _allItems.where((item) {
      if (_selectedCategory == CategoryEnum.extras) {
        return item.category.isExtraGroupType;
      }

      return item.category == _selectedCategory;
    }).toList();
  }
}
