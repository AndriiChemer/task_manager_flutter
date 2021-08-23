import 'package:flutter/material.dart';
import 'package:flutter_task_manager/core/theme/theme.dart';

class ButtonWidget extends StatelessWidget {

  final String title;
  final VoidCallback? onPressed;
  final bool? isLoading;
  final Color? textColor;
  final Color? buttonColor;

  const ButtonWidget({Key? key, this.onPressed, required this.title, this.isLoading, this.textColor, this.buttonColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var buttonStyle = _getButtonStyle(context);

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: buttonStyle,
        onPressed: onPressed,
        child: isLoading ?? false ? CircularProgressIndicator(color: Colors.white,) : Text(
          title,
          style: TextStyle(fontSize: 20),
        )
      ),
    );
  }

  ButtonStyle? _getButtonStyle(BuildContext context) {
    if(textColor == null && buttonColor == null) {
      return Theme.of(context).elevatedButtonTheme.style;
    } else if(textColor != null && buttonColor != null) {
      return ElevatedButton.styleFrom(
        primary: buttonColor,
        onPrimary: textColor,
      );
    } else if(buttonColor != null) {
      return ElevatedButton.styleFrom(
        primary: buttonColor,
      );
    } else if(textColor != null) {
      return ElevatedButton.styleFrom(
        onPrimary: textColor,
      );
    }
  }
}
