import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_task_manager/core/routes/navigation.dart';
import 'package:flutter_task_manager/features/injector.dart';

NavigationService useNavigator([List<dynamic> keys = const <dynamic>[]]) {
  final navigator = useMemoized(() => getIt<NavigationService>(), keys);
  return navigator;
}