import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_task_manager/core/model/filters_model.dart';
import 'package:flutter_task_manager/core/utils/extension.dart';
import 'package:flutter_task_manager/features/presentation/screens/filters/filter_page_cubit.dart';
import 'package:flutter_task_manager/features/presentation/widgets/app_bar/navigation_button.dart';
import 'package:flutter_task_manager/features/presentation/widgets/hooks/cubit_hooks.dart';
import 'package:flutter_task_manager/features/presentation/widgets/widgets.dart';

class FilterScreen extends HookWidget {
  static const String id = "filter_screen";

  @override
  Widget build(BuildContext context) {
    final cubit = useCubit<FilterPageCubit>();
    final state = useCubitBuilder(cubit);

    useEffect(() {
      cubit.initialize();
    });

    return Scaffold(
      appBar: CustomAppBar.create(
        title: context.getString("settings"),
        leading: NavigationButton.backWithTitle(),
      ),
      body: SafeArea(
        child: state.maybeWhen(
          idle: (filterModel) => _Content(cubit, filterModel),
          loading: () => const SizedBox(),
          orElse: () => const SizedBox(),
        ),
      ),
    );
  }
}

class _Content extends HookWidget {
  final FilterPageCubit _cubit;
  final FiltersModel _filtersModel;

  _Content(this._cubit, this._filtersModel);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilterPopupItem(
          icon: Icon(Icons.sort, size: 30,),
          text:_filtersModel.sortBy,
          items: _filtersModel.sortByItems,
          onItemSelected: _cubit.setSortBy
        ),

        FilterPopupItem(
          icon: RotatedBox(
            quarterTurns: 1,
            child: Icon(Icons.compare_arrows, size: 30,)
          ),
          text: _filtersModel.orderBy,
          items: _filtersModel.orderByItems,
          onItemSelected: _cubit.setOrderBy
        ),

      ],
    );
  }

}