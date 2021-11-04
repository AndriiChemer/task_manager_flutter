abstract class FilterRepository {
  Future<String> getSortByType();
  Future<String> getOrderByType();
  Future<void> setSortByType(String filterType);
  Future<void> setOrderByType(String sortType);
}