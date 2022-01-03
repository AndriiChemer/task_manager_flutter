import 'package:flutter_task_manager/core/usecase/usecase.dart';
import 'package:flutter_task_manager/features/domain/filter/filter_store.dart';
import 'package:injectable/injectable.dart';

@injectable
class SetSortByUseCase implements UseCase<void, String> {
  final FilterStore _filterStore;

  const SetSortByUseCase(this._filterStore);

  @override
  Future<void> call({required String params}) => _filterStore.setSortBy(params);
}