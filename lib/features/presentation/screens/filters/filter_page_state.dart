part of 'filter_page_cubit.dart';

@freezed
class FilterPageState with _$FilterPageState {
  @Implements(BuildState)
  const factory FilterPageState.loading() = _FilterPageStateLoading;

  @Implements(BuildState)
  const factory FilterPageState.idle(FiltersModel filtersModel) = _FilterPageStateIdle;
}
