import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'bloc/toggle_bloc.dart';

class ToggleWidget extends StatefulWidget {
  final String? initialItem;
  final List<String> items;
  final BehaviorSubject<String?>? controller;

  const ToggleWidget({Key? key, required this.items, this.initialItem, this.controller}) : super(key: key);

  @override
  _ToggleWidgetState createState() => _ToggleWidgetState();
}

class _ToggleWidgetState extends State<ToggleWidget> {
  
  late ToggleBloc _toggleBloc;

  @override
  void initState() {
    _toggleBloc = ToggleBloc(items: widget.items, initialItem: widget.initialItem);
    widget.controller?.add(widget.initialItem);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    double itemWidth = _getItemWidth();

    return BlocProvider(
      create: (_) => _toggleBloc,
      child: Container(
        child: BlocBuilder<ToggleBloc, ToggleState>(
          builder: (context, state) {

            _setItemSelected(state.items);
            List<Widget> buttons = convertMapItemsToWidgets(state.items, itemWidth);

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: buttons
            );
          },
        ),
      ),
    );
  }

  List<Widget> convertMapItemsToWidgets(Map<int, bool> items, double itemWidth) {
    List<Widget> buttons = items.entries.map((mapItem) =>

        ToggleItem(index: mapItem.key,
            title: widget.items[mapItem.key],
            isSelected: mapItem.value,
            itemWidth: itemWidth
        )

    ).toList();

    return buttons;
  }

  double _getItemWidth() {
    var itemCount = widget.items.length + 0.7;
    var screenSize = MediaQuery.of(context).size;
    return screenSize.width / itemCount;
  }

  void _setItemSelected(Map<int, bool> items) {
    var selectedIndex = _getSelectedIndex(items);
    
    if(selectedIndex != null) {
      var selectedItemTitle = widget.items[selectedIndex];
      widget.controller?.add(selectedItemTitle);
    } else {
      widget.controller?.add(null);
    }
  }
  
  int? _getSelectedIndex(Map<int, bool> items) {
    for(var item in items.entries) {
      if(item.value) {
        return item.key;
      }
    }

    return null;
  }
  
}

class ToggleItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final int index;
  final double? itemWidth;
  final double? itemHeight;

  ToggleItem({Key? key, required this.title, required this.isSelected, this.itemWidth, this.itemHeight, required this.index});

  @override
  Widget build(BuildContext context) {
    var borderColor = Theme.of(context).appBarTheme.color ?? Colors.black;
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

