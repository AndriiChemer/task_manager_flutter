import 'package:flutter_task_manager/data/local/local.dart';

class FiltersRepository {
  Future<String> getFilterType() {
    return FiltersPreferences.getFilterType();
  }

  Future<String> getSortingType() {
    return FiltersPreferences.getSortType();
  }

  Future<void> setFilterType(String filterType) async {
    await FiltersPreferences.setFilterType(filterType);
  }

  Future<void> setSortingType(String sortType) async {
    await FiltersPreferences.setSortType(sortType);
  }
}