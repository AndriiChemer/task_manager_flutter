import 'package:flutter/material.dart';

class AuthorizationTitleWidget extends StatelessWidget {

  final String? title;
  final double? fontSize;
  final FontWeight? fontWeight;

  const AuthorizationTitleWidget({Key? key, this.title, this.fontSize, this.fontWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title ?? '',
        style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
      ),
    );
  }
}
