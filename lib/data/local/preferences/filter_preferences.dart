import 'package:flutter_task_manager/data/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FiltersPreferences {
  static const String _FILTER_KEY = "filter_key";
  static const String _SORT_KEY = "sort_key";

  static late SharedPreferences _prefs;

  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  static Future<bool> setFilterType(String token) async =>
      await _prefs.setString(_FILTER_KEY, token);

  static Future<String> getFilterType() async {
    var filterType = _prefs.getString(_FILTER_KEY);

    if(filterType == null) return FilterTypes.filter[0];

    return filterType;
  }


  static Future<bool> setSortType(String token) async =>
      await _prefs.setString(_SORT_KEY, token);

  static Future<String> getSortType() async {
    var sortType = _prefs.getString(_SORT_KEY);

    if(sortType == null) return FilterTypes.sort[0];

    return sortType;
  }
}