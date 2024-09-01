import 'package:shared_preferences/shared_preferences.dart';

class AppSp {
  static late SharedPreferences _sp;

  static Future init() async {
    _sp = await SharedPreferences.getInstance();
  }

  static Future<bool> setString({required String key, required String value}) async {
    return await _sp.setString(key, value);
  }

  static Future<bool> setInt({required String key, required int value}) async {
    return await _sp.setInt(key, value);
  }

  static Future<bool> setDouble({required String key, required double value}) async =>
      await _sp.setDouble(key, value);

  static Future<bool> setBool({required String key, required bool value}) async {
    return await _sp.setBool(key, value);
  }

  static String? getString(String key) => _sp.getString(key);

  static int? getInt(String key) => _sp.getInt(key);

  static double getDouble(String key) => _sp.getDouble(key) ?? -1;

  static bool getBool(String key) => _sp.getBool(key) ?? false;

  static Future<bool> removeKey(String key) => _sp.remove(key);
  static Future<bool> clear() async {
    return await _sp.clear();
  }
}

abstract class SPVars {
  static const isDark = "ssd";
  static const welcomeViewed = "as";
  static const loggedIn = "dds";
  static const userID = "www";
  static const userEmail = "aaa";
  static const userName = "gfs";
  static const userNick = "asda";
  static const userPhone = "asd";
  static const userRate = "asds";
  static const userRegDate = "asdaa";
  static const userImageURL = "qqq";
  static const sessionToken = "sss";
  static const videoMoveValue = "eee";
  static const locale = "eee1";
}
