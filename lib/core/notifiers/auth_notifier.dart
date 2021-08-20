import 'package:flutter/material.dart';

class AuthNotifier extends ChangeNotifier {
  bool isUserAuthorized = true;

  void setUserAuthorization(bool isUserAuthorized) {
    this.isUserAuthorized = isUserAuthorized;
    notifyListeners();
  }
}