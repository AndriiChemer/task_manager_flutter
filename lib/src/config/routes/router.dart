import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_manager/data/remote/remote.dart';
import 'package:flutter_task_manager/data/repository/repository.dart';
import 'package:flutter_task_manager/depicated/core/converters/converters.dart';
import 'package:flutter_task_manager/depicated/core/notifiers/auth_notifier.dart';
import 'package:flutter_task_manager/src/presentation/blocs/blocs.dart';
import 'package:flutter_task_manager/src/presentation/screens/screens.dart';

class AppRouter {

  late Api _api;
  late TaskRepository _taskRepository;
  late UserRepository _userRepository;
  late FiltersRepository _filtersRepository;

  late TaskListBloc _tasksBloc;
  late FiltersBloc _filtersBloc;
  late AddEditTaskBloc _addEditTaskBloc;

  final AuthNotifier authNotifier = AuthNotifier();

  AppRouter() {
    _api = ApiProvider(authNotifier);
    
    _userRepository = UserRepository(api: _api);
    _taskRepository = TaskRepository(api: _api);
    _filtersRepository = FiltersRepository();

    _tasksBloc = TaskListBloc(taskRepository: _taskRepository, taskListConverter: TaskListConverter(), filtersRepository: _filtersRepository);
    _addEditTaskBloc = AddEditTaskBloc(tasksBloc: _tasksBloc, taskRepository: _taskRepository, taskConverter: TaskConverter(),);
    _filtersBloc = FiltersBloc(filtersRepository: _filtersRepository);
  }

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
            BlocProvider(create: (_) => LoginRegistrationBloc()),
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