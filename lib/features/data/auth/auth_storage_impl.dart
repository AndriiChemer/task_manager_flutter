import 'package:flutter_task_manager/features/domain/auth/auth_store.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: AuthStore)
class AuthStorageImpl implements AuthStore {
  static const String _TOKEN_KEY = "token_key";
  final SharedPreferences _prefs;

  AuthStorageImpl(this._prefs);

  @override
  Future<bool> saveToken(String token) async =>
      await _prefs.setString(_TOKEN_KEY, token);

  @override
  Future<String> getToken() async {
    final token = _prefs.getString(_TOKEN_KEY);

    if(token == null) return "";

    return token;
  }

  @override
  Future<void> clear() async {
    await _prefs.remove(_TOKEN_KEY);
  }
}