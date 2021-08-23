part of 'filters_bloc.dart';

@immutable
abstract class FiltersEvent {}

class LoadFiltersEvent extends FiltersEvent {}

class SetFilterEvent extends FiltersEvent {
  final String filterType;

  SetFilterEvent(this.filterType);
}

class SetSortEvent extends FiltersEvent {
  final String sortType;

  SetSortEvent(this.sortType);
}