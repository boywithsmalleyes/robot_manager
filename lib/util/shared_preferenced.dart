import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefenenceUtil {
  static void setData(key, value) async {
    var sp = await SharedPreferences.getInstance();
    if (value.runtimeType == int) {
      await sp.setInt(key, value);
    } else if (value.runtimeType == double) {
      await sp.setDouble(key, value);
    } else if (value.runtimeType == bool) {
      await sp.setBool(key, value);
    } else if (value.runtimeType == String) {
      await sp.setString(key, value);
    } else if (value.runtimeType == List) {
      await sp.setStringList(key, value);
    }
  }

  static Future<int> getIntData(String key) async {
    var prefs = await SharedPreferences.getInstance();
    var value = prefs.getInt(key) ?? 0 + 1;
    return value;
  }

  static void setIntData(key, value) async {
    var sp = await SharedPreferences.getInstance();
    await sp.setInt(key, value);
  }

  static Future<String> getStringData(key) async {
    var sp = await SharedPreferences.getInstance();
    return sp.getString(key) ?? "";
  }

  static void setStringData(key, value) async {
    var sp = await SharedPreferences.getInstance();
    await sp.setString(key, value);
  }

  static Future<bool> getBoolData(key) async {
    var sp = await SharedPreferences.getInstance();
    return sp.getBool(key) ?? false;
  }

  static void setBoolData(key, value) async {
    var sp = await SharedPreferences.getInstance();
    if (value.runtimeType == bool) {}
    await sp.setBool(key, value);
  }
}
