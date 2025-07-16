import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (sharedPreferences == null) {
      await init();
    }

    if (value is String) {
      return await sharedPreferences!.setString(key, value);
    }
    if (value is int) {
      return await sharedPreferences!.setInt(key, value);
    }
    if (value is bool) {
      return await sharedPreferences!.setBool(key, value);
    }

    return await sharedPreferences!.setDouble(key, value);
  }

  static dynamic getData({required String key}) {
    if (sharedPreferences == null) {
      return null;
    }
    return sharedPreferences!.get(key);
  }

  static Future<bool> removeData({
    required String key,
  }) async {
    if (sharedPreferences == null) {
      await init();
    }
    return await sharedPreferences!.remove(key);
  }

  static Future<bool> clearAllData() async {
    if (sharedPreferences == null) {
      await init();
    }
    return await sharedPreferences!.clear();
  }
}
