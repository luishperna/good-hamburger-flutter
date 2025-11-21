import 'package:flutter/material.dart';
import 'package:good_hamburger/features/main/models/main_tab_enum.dart';

class MainViewModel extends ChangeNotifier {
  MainTabEnum _selectedTab = MainTabEnum.menu;

  int get currentTabIndex => _selectedTab.index;

  void setTabIndex(int index) {
    final newTab = MainTabEnum.fromIndex(index);

    if (_selectedTab == newTab) return;
    _selectedTab = newTab;
    notifyListeners();
  }
}
