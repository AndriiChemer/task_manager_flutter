import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_manager/features/presentation/blocs/blocs.dart';
import 'package:flutter_task_manager/features/presentation/screens/screens.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AppRouter {

  Route generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case LoginRegistrationScreen.id:
        return _getLoginRegistrationScreen();
      case TaskListScreen.id:
        return _getTaskListScreen();
      case AddEditScreen.id:
        return _getAddEditScreen();
      case FilterScreen.id:
        return _getFilterScreen();
      default:
        return _getTaskListScreen();
    }
  }

  MaterialPageRoute _getAddEditScreen() {
    return MaterialPageRoute(
        builder: (_) =>
            BlocProvider.value(
              value: GetIt.instance.get<AddEditTaskBloc>(),
              child: AddEditScreen(),
            )
    );
  }

  MaterialPageRoute _getTaskListScreen() {
    return MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider.value(value: GetIt.instance.get<AuthStateCubit>(),),
            BlocProvider.value(value: GetIt.instance.get<TaskListBloc>(),),
            BlocProvider.value(value: GetIt.instance.get<AddEditTaskBloc>(),),
          ],
          child: TaskListScreen(),
        )
    );
  }

  MaterialPageRoute _getLoginRegistrationScreen() {
    return MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => GetIt.instance.get<CredentialTypeCubit>()),
            BlocProvider(create: (_) => GetIt.instance.get<AuthBloc>())
          ],
          child: LoginRegistrationScreen(),
        )
    );
  }

  MaterialPageRoute _getFilterScreen() {
    return MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider.value(value: GetIt.instance.get<FilterCubit>()),
          ],
          child: FilterScreen(),
        )
    );
  }
}