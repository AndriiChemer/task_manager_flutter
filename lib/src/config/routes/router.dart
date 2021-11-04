import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_manager/src/presentation/blocs/blocs.dart';
import 'package:flutter_task_manager/src/presentation/screens/screens.dart';

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
        builder: (_) => BlocProvider.value(
          value: _addEditTaskBloc,
          child: AddEditScreen(),
        )
    );
  }

  MaterialPageRoute _getTaskListScreen() {
    return MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider.value(value: AuthStateCubit(authNotifier: authNotifier)),
            BlocProvider.value(value: _tasksBloc),
            BlocProvider.value(value: _addEditTaskBloc),
          ],
          child: TaskListScreen(),
        )
    );
  }

  MaterialPageRoute _getLoginRegistrationScreen() {
    return MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => CredentialTypeCubit()),
            BlocProvider(create: (_) => AuthBloc(userRepository: _userRepository))
          ],
          child: LoginRegistrationScreen(),
        )
    );
  }

  MaterialPageRoute _getFilterScreen() {
    return MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider.value(value: _filtersBloc,),
            // BlocProvider(create: (_) => _filtersBloc),
          ],
          child: FilterScreen(),
        )
    );
  }
}