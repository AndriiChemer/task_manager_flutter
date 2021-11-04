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

    if(event is SetSortByEvent) {
      yield* _mapSortByState(event);
    }

    if(event is SetOrderByEvent) {
      yield* _mapOrderByState(event);
    }
  }

  Stream<FiltersState> _mapLoadingFilterState() async* {
    var filterType = await filtersRepository.getSortByType();
    var orderBy = await filtersRepository.getOrderByType();
    var filterModel = FiltersModel(sortBy: filterType, orderBy: orderBy);

    yield FiltersLoaded(filtersModel: filterModel);
  }

  Stream<FiltersState> _mapSortByState(SetSortByEvent event) async* {
    var sortBy = event.sortBy;
    await filtersRepository.setSortByType(sortBy);

    yield* _mapLoadingFilterState();
  }

  Stream<FiltersState> _mapOrderByState(SetOrderByEvent event) async* {
    var orderBy = event.orderBy;
    await filtersRepository.setOrderByType(orderBy);

    yield* _mapLoadingFilterState();
  }

  void onSortBySelect(String value) {
    add(SetSortByEvent(value));
  }

  void onOrderBySelect(String value) {
    add(SetOrderByEvent(value));
  }
}
