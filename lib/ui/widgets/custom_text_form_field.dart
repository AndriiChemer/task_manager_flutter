import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_manager/bloc/blocs.dart';

class CustomTextFormWidget extends StatefulWidget {
  final String? label; //context.getString("email")
  final String? initialValue;
  final bool? obscureText;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final int? maxLines;
  final double? borderWidth;
  final Color? borderColor;
  final TextEditingController? controller;

  const CustomTextFormWidget({
    Key? key,
    this.validator,
    this.label,
    this.keyboardType,
    this.obscureText,
    this.maxLines,
    this.borderWidth,
    this.borderColor,
    this.controller,
    this.initialValue}) : super(key: key);

  @override
  _CustomTextFormWidgetState createState() => _CustomTextFormWidgetState();
}

class _CustomTextFormWidgetState extends State<CustomTextFormWidget> {
  @override
  Widget build(BuildContext context) {

    if(widget.obscureText == null) return _buildTextFormField();

    return BlocBuilder<VisibilityPasswordBloc, VisibilityPasswordState>(
        builder: (context, state) {

          var isObfuscate = state is VisibilityPasswordInvisible ? true : false;

          return _buildTextFormField(isObfuscate);
        }
    );
  }

  Widget _buildTextFormField([bool isObfuscate = false]) {
    double borderWidth = widget.borderWidth ?? 1.0;
    Color borderColor = widget.borderColor ?? Theme.of(context).iconTheme.color!;

    return TextFormField(
      initialValue: widget.initialValue,
      controller: widget.controller,
      validator: widget.validator,
      obscureText: isObfuscate,
      maxLines: widget.maxLines ?? 1,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: widget.label,
          suffixIcon: _getObfuscateIcon(isObfuscate),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: borderWidth),
              borderRadius: BorderRadius.circular(5.0)
          )
      ),
    );
  }

  Widget? _getObfuscateIcon(bool isObfuscate) {
    if(widget.obscureText == null) return null;

    return IconButton(
      icon: Icon(
        isObfuscate
            ? Icons.visibility_off
            : Icons.visibility,
        color: Theme.of(context).primaryColorDark,
      ),
      onPressed: () {
        BlocProvider.of<VisibilityPasswordBloc>(context).onVisibilityButtonClick();
      },
    );
  }
}
