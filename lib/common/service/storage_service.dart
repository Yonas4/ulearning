import 'package:shared_preferences/shared_preferences.dart';

import '../Value/constant.dart';

class StorageService {
  late final SharedPreferences _preferences;

  Future<StorageService> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  setBool(String key, bool value) async {
    return await _preferences.setBool(key, value);
  }

  setString(String key, String value) async {
    return await _preferences.setString(key, value);
  }

  bool getDeviceFirstOpen() {
    return _preferences.getBool(AppConstant.STORAGE_DEVICE_FIRSTE_OPEN) ??
        false;
  }

  bool getIsLoggedIn() {
    return _preferences.getString(AppConstant.STORAGE_USER_TOKEN_KEY) == null
        ? false
        : true;
  }

  Future<bool> remove(String key) {
    return _preferences.remove(key);
  }
}
