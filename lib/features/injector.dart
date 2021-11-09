import 'package:flutter_task_manager/core/preferences/preferences.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureDependencies() async {

  getIt.registerFactory<AuthStorageImpl>(() => AuthStorageImpl(getIt.get()));
  getIt.registerFactory<FiltersPreferences>(() => FiltersPreferences(getIt.get()));

  await $initGetIt(getIt, environment: Environment.prod);
}
