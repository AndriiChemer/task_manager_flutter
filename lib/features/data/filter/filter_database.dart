import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class FilterDatabase {
  static const _oderByKey = 'oderByKey';
  static const _sortByKey = 'sortByKey';

  final SharedPreferences _prefs;

  FilterDatabase(this._prefs);

  Future<bool> saveOrderBy(String orderBy) async =>
      await _prefs.setString(_oderByKey, orderBy);

  Future<String?> getOrderBy() async => _prefs.getString(_oderByKey);

  Future<bool> saveSortBy(String sortBy) async =>
      await _prefs.setString(_sortByKey, sortBy);

  Future<String?> getSortBy() async => _prefs.getString(_sortByKey);
}