import 'package:flutter/material.dart';
import 'package:flutter_task_manager/core/theme/theme_data.dart';
import 'package:get_it/get_it.dart';

import 'core/routes/navigation.dart';
import 'core/routes/router.dart';
import 'core/utils/app_localizations.dart';
import 'features/injector.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(TaskManager());
}

class TaskManager extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    print("ANDRII conflict 1");
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