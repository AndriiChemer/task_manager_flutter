import 'package:flutter/material.dart';
import 'data/local/local.dart';
import 'ui/router/router.dart';
import 'core/theme/theme_data.dart';
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