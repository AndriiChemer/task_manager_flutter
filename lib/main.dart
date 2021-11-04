import 'package:flutter/material.dart';
import 'package:flutter_task_manager/src/config/theme/theme.dart';
import 'package:flutter_task_manager/src/core/preferences/preferences.dart';
import 'src/config/routes/router.dart';
import 'utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AuthPreferences.init();
  await FiltersPreferences.init();

  runApp(TaskManager(
    router: AppRouter(),
  ));
}

class TaskManager extends StatelessWidget {

  final AppRouter router;

  const TaskManager({required this.router});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Task manager',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
      theme: ThemeConfig.theme,
      localizationsDelegates: [
        AppLocalizations.delegate,
      ],
    );
  }
}