import 'filter_types.dart';

class FiltersModel {
  final String filterBy;
  final String sortBy;
  final List<String> filterByItems = FilterTypes.filter;
  final List<String> sortByItems = FilterTypes.sort;

  FiltersModel({required this.filterBy, required this.sortBy});
}