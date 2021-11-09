import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rxdart/rxdart.dart';

import 'bloc/toggle_bloc.dart';

class ToggleWidget extends HookWidget {
  final String? initialItem;
  final List<String> items;
  final BehaviorSubject<String?>? controller;

  ToggleWidget({
    Key? key,
    required this.items,
    this.initialItem,
    this.controller}) : super(key: key) {

    controller?.add(initialItem);
  }

  @override
  Widget build(BuildContext context) {
    final itemWidth = useMemoized(() => _getItemWidth(context));
    final _toggleBloc = useMemoized(() => ToggleBloc(items: items, initialItem: initialItem));

    return BlocProvider(
      create: (_) => _toggleBloc,
      child: Container(
        child: BlocBuilder<ToggleBloc, ToggleState>(
          builder: (context, state) {

            _showSelectedItem(state.indexItems);
            List<Widget> buttons = _convertMapItemsToWidgets(state.indexItems, itemWidth);

            return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: buttons
            );
          },
        ),
      ),
    );
  }

  void _showSelectedItem(Map<int, bool> indexItems) {
    final containSelectedIndex = indexItems.entries.contains(true);

    if(containSelectedIndex) {
      final selectedIndex = indexItems.entries
          .firstWhere((item) => item.value == true).key;

      final selectedItemTitle = items[selectedIndex];
      controller?.add(selectedItemTitle);
    }
  }

  List<Widget> _convertMapItemsToWidgets(Map<int, bool> indexItems, double itemWidth) {
    List<Widget> buttons = indexItems.entries.map((indexItem) =>

        ToggleItem(
          index: indexItem.key,
          title: items[indexItem.key],
          isSelected: indexItem.value,
          itemWidth: itemWidth
        )

    ).toList();

    return buttons;
  }

  double _getItemWidth(BuildContext context) {
    var itemCount = items.length + 0.7;
    var screenSize = MediaQuery.of(context).size;
    return screenSize.width / itemCount;
  }
}

class ToggleItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final int index;
  final double? itemWidth;
  final double? itemHeight;

  ToggleItem({
    Key? key,
    required this.title,
    required this.isSelected,
    this.itemWidth,
    this.itemHeight,
    required this.index});

  @override
  Widget build(BuildContext context) {
    var borderColor = Theme.of(context).appBarTheme.backgroundColor ?? Colors.black;
    var textColor = isSelected ? Colors.white : Theme.of(context).iconTheme.color;
    var backgroundColor = isSelected ? borderColor : Colors.white;

    return GestureDetector(
      onTap: () {
        _onButtonClick(context);
      },
      child: Container(
        width: itemWidth,
        height: itemHeight ?? 26,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor, width: 2.0),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: textColor,
              fontWeight:
              FontWeight.w800),
          ),
        ),
      ),
    );
  }

  void _onButtonClick(BuildContext context) {
    BlocProvider.of<ToggleBloc>(context).add(ToggleButtonClick(index));
  }
}

