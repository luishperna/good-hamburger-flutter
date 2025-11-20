import 'package:flutter/material.dart';

class UserGlobalViewModel extends ChangeNotifier {
  String? _userName;

  String? get userName => _userName;

  bool get isUserIdentified => _userName != null && _userName!.isNotEmpty;

  void setUser(String name) {
    _userName = name;
    notifyListeners();
  }
}
