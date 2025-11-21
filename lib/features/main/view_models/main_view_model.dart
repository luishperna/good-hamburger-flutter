import 'package:flutter/material.dart';

class MainViewModel extends ChangeNotifier {
  int _currentTabIndex = 0;

  int get currentTabIndex => _currentTabIndex;

  void setTabIndex(int index) {
    _currentTabIndex = index;
    notifyListeners();
  }

  bool isTabSelected(int index) => _currentTabIndex == index;
}
