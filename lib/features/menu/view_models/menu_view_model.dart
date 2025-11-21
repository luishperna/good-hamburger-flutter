import 'package:flutter/material.dart';
import 'package:good_hamburger/features/menu/repositories/menu_repository.dart';

import '../models/item_model.dart';

class MenuViewModel extends ChangeNotifier {
  final MenuRepository _repository;

  MenuViewModel(this._repository);

  bool _isLoading = false;
  List<ItemModel> _items = [];

  bool get isLoading => _isLoading;

  List<ItemModel> get items => _items;

  Future<void> fetchMenu() async {
    _isLoading = true;
    notifyListeners();

    try {
      _items = await _repository.getMenu();
    } catch (e) {
      debugPrint("Erro ao buscar menu: $e");
      _items = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
