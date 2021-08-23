import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_manager/bloc/filtersbloc/filters_bloc.dart';
import 'package:flutter_task_manager/ui/widgets/widgets.dart';
import 'package:flutter_task_manager/utils/utils.dart';

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
        child: BlocBuilder<FiltersBloc, FiltersState>(
          builder: (context, state) {
            if(state is FiltersLoaded) {

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
    BlocProvider.of<FiltersBloc>(context).onSortBySelect(value);
  }

  void onSortingTypeSelected(BuildContext context, String value) {
    BlocProvider.of<FiltersBloc>(context).onOrderBySelect(value);
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
