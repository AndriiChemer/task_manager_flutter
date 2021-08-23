part of 'filters_bloc.dart';

@immutable
abstract class FiltersState {}

class FiltersInitial extends FiltersState {}

class FiltersLoaded extends FiltersState {
  final FiltersModel filtersModel;

  FiltersLoaded({required this.filtersModel});
}
