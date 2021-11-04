import 'package:flutter_task_manager/src/data/models/filter_types.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FiltersPreferences {
  static const String _SORT_BY_KEY = "sort_by_key";
  static const String _ORDER_BY_KEY = "order_by_key";

  static late SharedPreferences _prefs;

  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  static Future<bool> setSortByType(String token) async =>
      await _prefs.setString(_SORT_BY_KEY, token);

  static Future<String> getSortByType() async {
    var filterType = _prefs.getString(_SORT_BY_KEY);

    if(filterType == null) return FilterTypes.sortBy[0];

    return filterType;
  }


  static Future<bool> setOrderByType(String value) async =>
      await _prefs.setString(_ORDER_BY_KEY, value);

  static Future<String> getOrderByType() async {
    var sortType = _prefs.getString(_ORDER_BY_KEY);

    if(sortType == null) return FilterTypes.orderBy[0];

    return sortType;
  }
}