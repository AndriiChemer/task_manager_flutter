import 'package:bloc/bloc.dart';
import 'package:flutter_task_manager/core/model/filters_model.dart';
import 'package:flutter_task_manager/features/domain/filter/use_case/load_filter_data_use_case.dart';
import 'package:flutter_task_manager/features/domain/filter/use_case/set_order_by_use_case.dart';
import 'package:flutter_task_manager/features/domain/filter/use_case/set_sort_by_use_case.dart';
import 'package:flutter_task_manager/features/presentation/widgets/hooks/cubit_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'filter_page_state.dart';
part 'filter_page_cubit.freezed.dart';

@Injectable()
class FilterPageCubit extends Cubit<FilterPageState> {
  final LoadFilterDataUseCase _loadFilterDataUseCase;
  final SetOrderByUseCase _setOrderByUseCase;
  final SetSortByUseCase _setSortByUseCase;

  late FiltersModel _filtersModel;

  FilterPageCubit(
    this._loadFilterDataUseCase,
    this._setOrderByUseCase,
    this._setSortByUseCase,
  ) : super(FilterPageState.loading());

  Future<void> initialize() async {
    _filtersModel = await _loadFilterDataUseCase();

    emit(FilterPageState.idle(_filtersModel));
  }

  Future<void> setOrderBy(String orderBy) async {
    await _setOrderByUseCase(params: orderBy);
    _filtersModel = _filtersModel.copyWith(orderBy: orderBy);

    emit(FilterPageState.idle(_filtersModel));
  }

  Future<void> setSortBy(String sortBy) async {
    await _setSortByUseCase(params: sortBy);
    _filtersModel = _filtersModel.copyWith(sortBy: sortBy);

    emit(FilterPageState.idle(_filtersModel));
  }


}
