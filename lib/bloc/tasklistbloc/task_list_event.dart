part of 'task_list_bloc.dart';

@immutable
abstract class TaskListEvent {
  final String sortType;
  final String orderBy;

  TaskListEvent({
    this.sortType = "",
    this.orderBy = ""});
}

class GetTaskListEvent extends TaskListEvent {
  GetTaskListEvent(String sortType, String orderBy)
      : super(sortType: sortType, orderBy: orderBy);
}

class RefreshTaskListEvent extends TaskListEvent {
  RefreshTaskListEvent(String sortType, String orderBy)
      : super(sortType: sortType, orderBy: orderBy);
}

class DeleteTaskEvent extends TaskListEvent {
  final TaskModel taskModel;
  
  DeleteTaskEvent({required this.taskModel});
}

class LoadMoreTaskListEvent extends TaskListEvent {
  final int currentPage;
  final int count;
  final int limit;

  LoadMoreTaskListEvent({
    required this.currentPage,
    required this.count,
    required this.limit,
    required String sortType,
    required String orderBy}) : super(sortType: sortType, orderBy: orderBy);
}

class AddNewTaskEvent extends TaskListEvent {
  final TaskModel taskModel;

  AddNewTaskEvent({required this.taskModel});
}

class UpdateTaskEvent extends TaskListEvent {
  final TaskModel taskModel;

  UpdateTaskEvent({required this.taskModel});
}
