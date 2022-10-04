import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _sharedPreferences;

 static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  /// boolean

 static bool? getBool({required String key}) {
    return _sharedPreferences.getBool(key);
  }

  /// string

 static Future<bool> setString({required String key, required String value}) {
    return _sharedPreferences.setString(key, value);
  }

 static String? getString({required String key}) {
    return _sharedPreferences.getString(key);
  }

  // static get(){
  //   return _sharedPreferences.
  // }
}
