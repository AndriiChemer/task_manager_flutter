part of 'filters_bloc.dart';

@immutable
abstract class FiltersEvent {}

class LoadFiltersEvent extends FiltersEvent {}

class SetSortByEvent extends FiltersEvent {
  final String sortBy;

  SetSortByEvent(this.sortBy);
}

class SetOrderByEvent extends FiltersEvent {
  final String orderBy;

  SetOrderByEvent(this.orderBy);
}