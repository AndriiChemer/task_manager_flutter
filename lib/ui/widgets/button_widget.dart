import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {

  final String title;
  final VoidCallback? onPressed;
  final bool? isLoading;

  const ButtonWidget({Key? key, this.onPressed, required this.title, this.isLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
          onPressed: onPressed,
          child: isLoading ?? false ? CircularProgressIndicator(color: Colors.white,) : Text(
            title,
            style: TextStyle(fontSize: 20),
          )
      ),
    );
  }
}
