import 'package:shared_preferences/shared_preferences.dart';

class AuthPreferences {
  static const String TOKEN_KEY = "token_key";
  static late SharedPreferences _prefs;

  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  static Future<bool> saveToken(String token) async =>
      await _prefs.setString(TOKEN_KEY, token);

  static Future<String> getToken() async {
    var token = _prefs.getString(TOKEN_KEY);

    if(token == null) return "";

    return token;
  }
}