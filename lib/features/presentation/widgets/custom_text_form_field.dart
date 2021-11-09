import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomTextFormWidget extends HookWidget {
  final String? label;
  final String? initialValue;
  final bool? obscureText;
  final String? error;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? margin;
  final int? maxLines;
  final double borderWidth;
  final Color? borderColor;
  final TextEditingController? controller;
  final Function(String value) onTextChanged;

  const CustomTextFormWidget({
    Key? key,
    this.label,
    this.keyboardType,
    this.obscureText,
    this.maxLines,
    this.borderWidth = 1.0,
    this.borderColor,
    this.controller,
    this.initialValue,
    this.margin,
    this.error,
    required this.onTextChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final obfuscateState = useState(obscureText ?? false);
    final borderColor = this.borderColor ?? Theme.of(context).iconTheme.color!;

    return Container(
      margin: margin,
      child: TextFormField(
        initialValue: initialValue,
        controller: controller,
        obscureText: obfuscateState.value,
        maxLines: maxLines ?? 1,
        onChanged: onTextChanged,
        validator: (value) => error,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            labelText: label,
            errorText: error,
            suffixIcon: _getObfuscateIcon(context, obfuscateState),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: borderWidth),
                borderRadius: BorderRadius.circular(5.0)
            )
        ),
      ),
    );
  }

  Widget? _getObfuscateIcon(BuildContext context, ValueNotifier<bool> obfuscateState) {
    if(obscureText == null) return null;

    return IconButton(
      icon: Icon(
        obfuscateState.value
            ? Icons.visibility_off
            : Icons.visibility,
        color: Theme.of(context).primaryColorDark,
      ),
      onPressed: () {
        obfuscateState.value = !obfuscateState.value;
      },
    );
  }
}