import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ToggleWidget extends HookWidget {
  final String? initialItem;
  final List<String> items;
  final String? error;
  final EdgeInsetsGeometry? margin;
  final ValueNotifier<String?> controller;

  ToggleWidget({
    Key? key,
    required this.items,
    this.initialItem,
    this.margin,
    this.error,
    required this.controller
  }) : super(key: key) {
    controller.value = initialItem;
  }

  @override
  Widget build(BuildContext context) {
    final itemWidth = useMemoized(() => _getItemWidth(context));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: error != null ? BoxDecoration(
              border: Border.all(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.all(Radius.circular(5))
          ) : null,
          margin: margin,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: items.map((item) =>
                  ToggleItem(
                    title: item,
                    isSelected: item == controller.value,
                    itemWidth: itemWidth,
                    onItemClick: (String value) {
                      controller.value = value;
                    },
                  )
              ).toList()
          ),
        ),

        if(error != null) ...[
          Container(
            margin: EdgeInsets.only(left: 30),
            child: Text(error!, style: TextStyle(color: Colors.red, fontSize: 11),)
          )
        ]
      ],
    );
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
  final double? itemWidth;
  final double? itemHeight;
  final Function(String value) onItemClick;

  ToggleItem({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onItemClick,
    this.itemWidth,
    this.itemHeight});

  @override
  Widget build(BuildContext context) {
    var borderColor = Theme.of(context).appBarTheme.backgroundColor ?? Colors.black;
    var textColor = isSelected ? Colors.white : Theme.of(context).iconTheme.color;
    var backgroundColor = isSelected ? borderColor : Colors.white;

    return GestureDetector(
      onTap: () {
        onItemClick(title);
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
}

