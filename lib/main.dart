import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_task_manager/core/notifiers/auth_notifier.dart';
import 'package:flutter_task_manager/core/theme/theme_data.dart';
import 'package:flutter_task_manager/features/presentation/screens/auth/auth_page.dart';
import 'package:flutter_task_manager/features/presentation/widgets/hooks/change_notifier_hook.dart';
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

class TaskManager extends HookWidget {

  @override
  Widget build(BuildContext context) {

    final navigationService = GetIt.instance.get<NavigationService>();
    final appRouter = GetIt.instance.get<AppRouter>();

    useChangeNotifierListener<AuthNotifier>((changeNotifier) => _listener(changeNotifier));

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

  void _listener(AuthNotifier changeNotifier) {



    if(!changeNotifier.isUserAuthorized) {
      GetIt.instance.get<NavigationService>()
          .pushReplacement(AuthPage.id);
    }
  }



}