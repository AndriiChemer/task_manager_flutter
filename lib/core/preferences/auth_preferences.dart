import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPreferences {
  static const String _TOKEN_KEY = "token_key";
  final SharedPreferences _prefs;

  AuthPreferences(this._prefs);

  Future<bool> saveToken(String token) async =>
      await _prefs.setString(_TOKEN_KEY, token);

  Future<String> getToken() async {
    var token = _prefs.getString(_TOKEN_KEY);

    if(token == null) return "";

    return token;
  }
}