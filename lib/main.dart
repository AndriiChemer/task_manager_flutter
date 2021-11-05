import 'package:flutter/material.dart';
import 'package:flutter_task_manager/src/config/routes/navigation.dart';
import 'package:flutter_task_manager/src/config/theme/theme.dart';
import 'package:flutter_task_manager/src/core/preferences/preferences.dart';
import 'package:flutter_task_manager/src/injector.dart';
import 'package:get_it/get_it.dart';
import 'src/config/routes/router.dart';
import 'src/core/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  await AuthPreferences.init();
  await FiltersPreferences.init();

  runApp(TaskManager());
}

class TaskManager extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navigationService = GetIt.instance.get<NavigationService>();
    final appRouter = GetIt.instance.get<AppRouter>();

    return MaterialApp(
      title: 'Task manager',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigationService.navigatorKey,
      onGenerateRoute: appRouter.generateRoute,
      theme: ThemeConfig.theme,
      localizationsDelegates: [
        AppLocalizations.delegate,
      ],
    );
  }
}