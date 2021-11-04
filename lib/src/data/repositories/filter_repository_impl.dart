import 'package:flutter_task_manager/src/data/datasources/local/local.dart';
import 'package:flutter_task_manager/src/domain/repositories/filter_repository.dart';

class FilterRepositoryImpl implements FilterRepository {
  @override
  Future<String> getOrderByType() => FiltersPreferences.getOrderByType();

  @override
  Future<String> getSortByType() => FiltersPreferences.getSortByType();

  @override
  Future<void> setOrderByType(String sortType) async =>
      await FiltersPreferences.setOrderByType(sortType);

  @override
  Future<void> setSortByType(String filterType) async =>
      await FiltersPreferences.setSortByType(filterType);
}