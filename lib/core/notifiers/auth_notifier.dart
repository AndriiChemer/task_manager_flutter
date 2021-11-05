import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthNotifier extends ChangeNotifier {
  bool isUserAuthorized = true;

  // final authNotifier = GetIt.instance.get<AuthNotifier>();
  void setUserAuthorization(bool isUserAuthorized) {
    this.isUserAuthorized = isUserAuthorized;
    notifyListeners();
  }
}