import 'package:flutter/material.dart';

class AuthorizationTitleWidget extends StatelessWidget {

  final String? title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Function()? onDoubleTap;

  const AuthorizationTitleWidget({
    Key? key,
    this.title,
    this.fontSize,
    this.fontWeight,
    this.onDoubleTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: onDoubleTap,
      child: Center(
        child: Text(
          title ?? '',
          style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
        ),
      ),
    );
  }
}
