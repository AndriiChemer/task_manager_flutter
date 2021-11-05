import 'package:bloc/bloc.dart';
import 'package:flutter_task_manager/core/model/models.dart';
import 'package:flutter_task_manager/core/preferences/preferences.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'filter_state.dart';

@injectable
class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterInitial()) {
    _loadFilterState();
  }

  _loadFilterState() async {
    final filterType = await FiltersPreferences.getSortByType();
    final orderBy = await FiltersPreferences.getOrderByType();
    final filterModel = FiltersModel(sortBy: filterType, orderBy: orderBy);

    emit(FilterLoaded(filterModel));
  }

  setSortBy(final String sortBy) async {
    await FiltersPreferences.setSortByType(sortBy);
    await _loadFilterState();
  }

  setOrderBy(final String orderBy) async {
    await FiltersPreferences.setOrderByType(orderBy);
    await _loadFilterState();
  }
}
