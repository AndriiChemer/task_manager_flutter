import 'package:flutter/material.dart';

class FilterPopupItem extends StatelessWidget {
  final Widget icon;
  final String text;
  final List<String> items;
  final Function(String)? onItemSelected;

  const FilterPopupItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.items,
    this.onItemSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {
        onItemSelected?.call(value.toString());
      },
      itemBuilder: (BuildContext context) => items.map((item) => PopupMenuItem(value: item, child: Text(item),)).toList(),
      child: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20,),
              child: Row(
                children: [
                  icon,
                  Expanded(
                    child: Container(),
                  ),
                  Text(text, style: const TextStyle(fontSize: 16),),
                ],
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
