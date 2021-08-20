import 'package:flutter/material.dart';
import '../../../utils/utils.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final Widget? leading;
  final Widget? action;

  const CustomAppBar({Key? key, this.title, this.leading, this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title ?? '' , style: TextStyle(color: Theme.of(context).textTheme.headline1!.color),),
      leadingWidth: 80,
      leading: leading,
      actions: [
        Container(
          margin: EdgeInsets.only(right: 10),
          child: action,

        ),
      ],
    );
  }
}
