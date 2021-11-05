import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_manager/core/utils/extension.dart';
import 'package:flutter_task_manager/features/presentation/blocs/blocs.dart';
import 'package:flutter_task_manager/features/presentation/widgets/widgets.dart';

class FilterScreen extends StatelessWidget {
  static const String id = "filter_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 57),
        child: SettingsAppBar(),
      ),
      body: SafeArea(
        child: BlocBuilder<FilterCubit, FilterState>(
          builder: (context, state) {
            if(state is FilterLoaded) {

              var filterModel = state.filtersModel;

              return Column(
                children: [

                  FilterPopupItem(
                      icon: Icon(Icons.sort, size: 30,),
                      text:filterModel.sortBy,
                      items: filterModel.sortByItems,
                      onItemSelected: onFilterTypeSelected
                  ),

                  FilterPopupItem(
                      icon: RotatedBox(
                          quarterTurns: 1,
                          child: Icon(Icons.compare_arrows, size: 30,)
                      ),
                      text: filterModel.orderBy,
                      items: filterModel.orderByItems,
                      onItemSelected: onSortingTypeSelected
                  ),

                ],
              );
            } else {
              return Container();
            }
          }
        ),
      ),
    );
  }

  void onFilterTypeSelected(BuildContext context, String value) {
    BlocProvider.of<FilterCubit>(context).setSortBy(value);
  }

  void onSortingTypeSelected(BuildContext context, String value) {
    BlocProvider.of<FilterCubit>(context).setOrderBy(value);
  }
}

class SettingsAppBar extends StatelessWidget {

  const SettingsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return CustomAppBar(
      title: context.getString("settings"),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          margin: EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Icon(Icons.arrow_back_ios_rounded, size: 26,),
              Text(
                context.getString("back"),
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Theme.of(context).iconTheme.color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
