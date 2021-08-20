part of 'tasks_bloc.dart';

@immutable
abstract class TasksState {
  final List<TaskModel> taskList;
  final int currentPage;
  final int limit;
  final int count;

  TasksState([this.taskList = const [], this.currentPage = 0, this.limit = 0, this.count = 0]);
}

class TasksInitial extends TasksState {
  TasksInitial() : super();
}

class TaskListLoadedSuccessState extends TasksState {

  TaskListLoadedSuccessState({
    required List<TaskModel> taskList,
    required int currentPage,
    required int limit,
    required int count}): super(taskList, currentPage, limit, count);

}

class TaskListLoadFailState extends TasksState {
  final String message;

  TaskListLoadFailState({
    required List<TaskModel> taskList, 
    this.message = "Something went wrong", 
    int currentPage = 0,
    int limit = 0,
    int count = 0
  }): super(taskList, currentPage, limit, count);
}

/// ============ Loading states ==================
class TaskListLoadingState extends TasksState {
  
  TaskListLoadingState({
    required List<TaskModel> taskList,
    required int currentPage,
    required int limit,
    required int count}): super(taskList, currentPage, limit, count);
}

class TaskListLoadingMoreState extends TasksState {}

class TaskListPaginationLoadingState extends TasksState {}
