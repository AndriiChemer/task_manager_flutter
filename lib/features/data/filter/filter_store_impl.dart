import 'package:flutter_task_manager/core/model/filter_types.dart';
import 'package:flutter_task_manager/core/model/filters_model.dart';
import 'package:flutter_task_manager/features/data/filter/filter_database.dart';
import 'package:flutter_task_manager/features/domain/filter/filter_store.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FilterStore)
class FilterStoreImpl implements FilterStore {
  final FilterDatabase _filterDatabase;

  FilterStoreImpl(this._filterDatabase);

  @override
  Future<FiltersModel> loadFilter() async {
    final orderBy = await _filterDatabase.getOrderBy();
    final sortBy = await _filterDatabase.getSortBy();

    return FiltersModel(
      orderBy: orderBy ?? FilterTypes.orderBy.first,
      sortBy: sortBy ?? FilterTypes.sortBy.first
    );
  }

  @override
  Future<void> setOrderBy(String orderBy) async {
    await _filterDatabase.saveOrderBy(orderBy);
  }

  @override
  Future<void> setSortBy(String sortBy) async {
    await _filterDatabase.saveSortBy(sortBy);
  }
}