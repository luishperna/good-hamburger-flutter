import 'package:flutter/material.dart';

import '../../features/user/repositories/user_repository.dart';
import '../models/user_model.dart';

class UserGlobalViewModel extends ChangeNotifier {
  final UserRepository _userRepository;

  UserGlobalViewModel(this._userRepository);

  UserModel? _user;

  UserModel? get user => _user;

  bool get isUserIdentified => _user?.name.isNotEmpty ?? false;

  Future<void> setUserName(String name) async {
    _user = UserModel(name: name);
    notifyListeners();
    await _userRepository.saveUserName(name);
  }

  Future<void> loadUserName() async {
    final userNameSaved = await _userRepository.getUserName();
    
    if (userNameSaved == null) return;
    _user = UserModel(name: userNameSaved);
    notifyListeners();
  }
}
