import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, [dynamic argument]) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: argument);
  }

  Future<dynamic> pushReplacement(String routeName) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false);
  }
}