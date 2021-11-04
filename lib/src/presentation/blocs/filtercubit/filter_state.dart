part of 'filter_cubit.dart';

@immutable
abstract class FilterState {}

class FilterInitial extends FilterState {}

class FilterLoaded extends FilterState {
  final FiltersModel filtersModel;

  FilterLoaded(this.filtersModel);
}
