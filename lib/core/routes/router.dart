import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_manager/features/domain/task/model/task.dart';
import 'package:flutter_task_manager/features/presentation/screens/addedittask/add_edit_task_page.dart';
import 'package:flutter_task_manager/features/presentation/screens/auth/auth_page.dart';
import 'package:flutter_task_manager/features/presentation/screens/filters/filter_page.dart';
import 'package:flutter_task_manager/features/presentation/screens/taskdetails/task_details_page.dart';
import 'package:flutter_task_manager/features/presentation/screens/tasklist/task_list_page.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AppRouter {

  Route generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case AuthPage.id:
        return MaterialPageRoute(builder: (_) => AuthPage());
      case TaskListScreen.id:
        return MaterialPageRoute(builder: (_) => TaskListScreen());
      case AddEditTaskPage.id:
        return _getAddEditScreen(settings);
      case FilterScreen.id:
        return MaterialPageRoute(builder: (_) => FilterScreen());
      case TaskDetailsPage.id:
        return _getTaskDetailsScreen(settings);
      default:
        return MaterialPageRoute(builder: (_) => TaskListScreen());
    }
  }

  MaterialPageRoute _getTaskDetailsScreen(RouteSettings settings) {
    Task taskModel = settings.arguments as Task;

    return MaterialPageRoute(builder: (_) => TaskDetailsPage(taskModel));
  }

  MaterialPageRoute _getAddEditScreen(RouteSettings settings) {
    Object? arguments = settings.arguments;
    Task? taskModel = arguments != null ? arguments as Task : null;

    return MaterialPageRoute(builder: (_) => AddEditTaskPage(taskModel: taskModel,));
  }
}