import 'package:bloc/bloc.dart';
import 'package:flutter_task_manager/core/model/models.dart';
import 'package:flutter_task_manager/core/preferences/preferences.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'filter_state.dart';

@injectable
class FilterCubit extends Cubit<FilterState> {
  final FiltersPreferences _filtersPreferences;

  FilterCubit(this._filtersPreferences) : super(FilterInitial()) {
    _loadFilterState();
  }

  _loadFilterState() async {
    final filterType = await _filtersPreferences.getSortByType();
    final orderBy = await _filtersPreferences.getOrderByType();
    final filterModel = FiltersModel(sortBy: filterType, orderBy: orderBy);

    emit(FilterLoaded(filterModel));
  }

  setSortBy(final String sortBy) async {
    await _filtersPreferences.setSortByType(sortBy);
    await _loadFilterState();
  }

  setOrderBy(final String orderBy) async {
    await _filtersPreferences.setOrderByType(orderBy);
    await _loadFilterState();
  }
}
