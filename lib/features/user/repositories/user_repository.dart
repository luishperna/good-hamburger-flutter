import 'package:good_hamburger/shared/services/local_preferences_service.dart';

class UserRepository {
  final LocalPreferencesService _localPreferencesService;

  static const String _userNameKey = 'USER_NAME';

  UserRepository(this._localPreferencesService);

  Future<void> saveUserName(String name) async {
    await _localPreferencesService.saveString(_userNameKey, name);
  }

  Future<String?> getUserName() async {
    return await _localPreferencesService.getString(_userNameKey);
  }
}
