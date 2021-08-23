import 'filter_types.dart';

class FiltersModel {
  final String sortBy;
  final String orderBy;
  final List<String> sortByItems = FilterTypes.sortBy;
  final List<String> orderByItems = FilterTypes.orderBy;

  FiltersModel({required this.sortBy, required this.orderBy});
}