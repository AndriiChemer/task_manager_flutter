
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_task_manager/features/injector.dart';

typedef ChangeNotifierListener<T extends ChangeNotifier> = void Function(T changeNotifier);

void useChangeNotifierListener<T extends ChangeNotifier>(
    ChangeNotifierListener<T> listener,
    [List<dynamic> keys = const <dynamic>[]]
){
  final changeNotifier = useMemoized(() => getIt<T>(), keys);
  changeNotifier.addListener(() {
    listener(changeNotifier);
  });
}