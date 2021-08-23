import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_task_manager/data/models/models.dart';
import 'package:flutter_task_manager/data/repository/repository.dart';
import 'package:meta/meta.dart';

part 'filters_event.dart';
part 'filters_state.dart';

class FiltersBloc extends Bloc<FiltersEvent, FiltersState> {

  final FiltersRepository filtersRepository;
  FiltersBloc({required this.filtersRepository})
      : super(FiltersInitial()) {
    add(LoadFiltersEvent());
  }

  @override
  Stream<FiltersState> mapEventToState(
    FiltersEvent event,
  ) async* {
    if(event is LoadFiltersEvent) {
      yield* _mapLoadingFilterState();
    }

    if(event is SetFilterEvent) {
      yield* _mapSettingFilterState(event);
    }

    if(event is SetSortEvent) {
      yield* _mapSettingSortState(event);
    }
  }

  Stream<FiltersState> _mapLoadingFilterState() async* {
    var filterType = await filtersRepository.getFilterType();
    var sortType = await filtersRepository.getSortingType();
    var filterModel = FiltersModel(filterBy: filterType, sortBy: sortType);

    yield FiltersLoaded(filtersModel: filterModel);
  }

  Stream<FiltersState> _mapSettingFilterState(SetFilterEvent event) async* {
    var filterBy = event.filterType;
    await filtersRepository.setFilterType(filterBy);

    yield* _mapLoadingFilterState();
  }

  Stream<FiltersState> _mapSettingSortState(SetSortEvent event) async* {
    var filterBy = event.sortType;
    await filtersRepository.setSortingType(filterBy);

    yield* _mapLoadingFilterState();
  }

  void onFilterTypeSelect(String value) {
    add(SetFilterEvent(value));
  }

  void onSortTypeSelect(String value) {
    add(SetSortEvent(value));
  }
}
