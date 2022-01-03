import 'package:flutter_task_manager/core/model/filters_model.dart';

abstract class FilterStore {
  Future<FiltersModel> loadFilter();

  Future<void> setOrderBy(String orderBy);

  Future<void> setSortBy(String sortBy);
}