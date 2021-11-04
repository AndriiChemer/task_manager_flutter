part of 'task_list_bloc.dart';

@immutable
abstract class TaskListState {
  final List<TaskModel> taskList;
  final int currentPage;
  final int limit;
  final int count;

  TaskListState([this.taskList = const [], this.currentPage = 0, this.limit = 0, this.count = 0]);
}

class TasksInitial extends TaskListState {
  TasksInitial() : super();
}

class TaskListLoadedSuccessState extends TaskListState {

  TaskListLoadedSuccessState({
    required List<TaskModel> taskList,
    required int currentPage,
    required int limit,
    required int count}): super(taskList, currentPage, limit, count);

}

class TaskListLoadFailState extends TaskListState {
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
class TaskListLoadingState extends TaskListState {
  
  TaskListLoadingState({
    required List<TaskModel> taskList,
    required int currentPage,
    required int limit,
    required int count}): super(taskList, currentPage, limit, count);
}

class TaskListLoadingMoreState extends TaskListState {}

class TaskListPaginationLoadingState extends TaskListState {}
