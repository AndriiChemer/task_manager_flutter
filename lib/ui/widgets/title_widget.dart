import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {

  final String title;

  const TitleWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Text(title, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Theme.of(context).iconTheme.color),),
    );;
  }
}
