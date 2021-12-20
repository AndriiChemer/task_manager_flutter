import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomAppBar extends HookWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  final String title;
  final Widget? leadingElement;
  final List<Widget> rightElements;

  const CustomAppBar({
    this.title = '',
    this.rightElements = const [],
    this.leadingElement,
  });

  factory CustomAppBar.create({
    required String title,
    Widget? leading,
    List<Widget>? rightElements
  }) => CustomAppBar(
    title: title,
    leadingElement: leading,
    rightElements: rightElements ?? [],
  );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title , style: TextStyle(fontSize: 18, color: Theme.of(context).textTheme.headline1!.color),),
      elevation: 0,
      automaticallyImplyLeading: false,
      leadingWidth: 80,
      leading: leadingElement,
      actions: rightElements
    );
  }
}
