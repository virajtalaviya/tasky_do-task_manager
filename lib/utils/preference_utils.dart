import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  static Future<SharedPreferences> get _instance async => _prefInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefInstance;

  static Future<SharedPreferences?> init() async {
    _prefInstance = await _instance;
    return _prefInstance;
  }

  static String getStringValue(String key, [String? defValue]) {
    return _prefInstance?.getString(key) ?? defValue ?? "";
  }

  static bool getBoolValue(String key, [bool? defValue]) {
    return _prefInstance?.getBool(key) ?? defValue ?? false;
  }

  static setString(String key, String value) async {
    var pref = await _instance;
    pref.setString(key, value);
  }

  static setBool(String key, bool value) async {
    var pref = await _instance;
    pref.setBool(key, value);
  }
}
