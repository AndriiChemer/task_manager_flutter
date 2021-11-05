import 'package:flutter/material.dart';
import 'package:flutter_task_manager/src/core/utils/utils.dart';

extension ProviderExtensions on BuildContext {
  String getString(String string) =>
      AppLocalizations.of(this).translate(string);

  showFeatureNotImplemented() {
    _showMessage("Feature not implemented yet!", Colors.white);
  }

  showPositiveMessage(String message) {
    _showMessage(message, Colors.green[800]);
  }

  showNegativeMessage(String message) {
    _showMessage(message, Colors.red[800]);
  }

  _showMessage(String message, Color? textColor) {
    Scaffold.of(this).showSnackBar(SnackBar(
      content: Text(message, style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.w600),),
      duration: Duration(seconds: 3),
    ));
  }
}