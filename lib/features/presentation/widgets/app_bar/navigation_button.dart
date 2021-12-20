import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NavigationButton extends HookWidget {
  final Function()? customAction;
  final String? backTitle;
  final IconData icon;

  const NavigationButton._({
    required this.icon,
    this.backTitle,
    this.customAction,
    Key? key,
  }) : super(key: key);

  factory NavigationButton.back({Function()? customAction}) {

    return NavigationButton._(
      icon: Icons.arrow_back_ios_rounded,
      customAction: customAction,
      backTitle: '',
    );
  }

  factory NavigationButton.backWithTitle({Function()? customAction, String? title}) {
    return NavigationButton._(
      icon: Icons.arrow_back_ios_rounded,
      customAction: customAction,
      backTitle: title,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: customAction ?? () => Navigator.pop(context),
      child: Container(
        margin: EdgeInsets.only(left: 10),
        child: Row(
          children: [
            Icon(Icons.arrow_back_ios_rounded, size: 26,),
            Text(
              backTitle ?? '',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Theme.of(context).iconTheme.color),
            ),
          ],
        ),
      ),
    );
  }
}