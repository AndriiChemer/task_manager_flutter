import 'package:flutter_task_manager/data/local/local.dart';

class FiltersRepository {
  Future<String> getSortByType() {
    return FiltersPreferences.getSortByType();
  }

  Future<String> getOrderByType() {
    return FiltersPreferences.getOrderByType();
  }

  Future<void> setSortByType(String filterType) async {
    await FiltersPreferences.setSortByType(filterType);
  }

  Future<void> setOrderByType(String sortType) async {
    await FiltersPreferences.setOrderByType(sortType);
  }
}