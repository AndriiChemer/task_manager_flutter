import 'package:flutter_task_manager/core/model/filters_model.dart';
import 'package:flutter_task_manager/core/usecase/usecase_without_param.dart';
import 'package:flutter_task_manager/features/domain/filter/filter_store.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoadFilterDataUseCase implements NoParamUseCase<FiltersModel> {
  final FilterStore _filterStore;

  const LoadFilterDataUseCase(this._filterStore);

  @override
  Future<FiltersModel> call() => _filterStore.loadFilter();
}