import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthNotifier extends ChangeNotifier {
  bool isUserAuthorized = true;

  void setUserAuthorization(bool isUserAuthorized) {
    this.isUserAuthorized = isUserAuthorized;
    notifyListeners();
  }
}