part of 'task_list_bloc.dart';

@immutable
abstract class TaskListState {
  final List<TaskModel> taskList;

  TaskListState([this.taskList = const []]);
}

class TasksInitial extends TaskListState {
  TasksInitial() : super();
}

class TaskListLoadedSuccessState extends TaskListState {

  TaskListLoadedSuccessState({
    required List<TaskModel> taskList
  }): super(taskList);

}

class TaskListLoadFailState extends TaskListState {
  final String message;

  TaskListLoadFailState({
    this.message = "Something went wrong",
  }): super();
}

/// ============ Loading states ==================
class TaskListLoadingState extends TaskListState {
  
  TaskListLoadingState({
    required List<TaskModel> taskList,
  }): super(taskList);
}

class TaskListLoadingMoreState extends TaskListState {}

class TaskListPaginationLoadingState extends TaskListState {}
