part of 'tasks_bloc.dart';

@immutable
abstract class TasksEvent {
  final String sortType;
  final String orderBy;

  TasksEvent({
    this.sortType = "",
    this.orderBy = ""});
}

class GetTaskListEvent extends TasksEvent {
  GetTaskListEvent(String sortType, String orderBy)
      : super(sortType: sortType, orderBy: orderBy);
}

class RefreshTaskListEvent extends TasksEvent {
  RefreshTaskListEvent(String sortType, String orderBy)
      : super(sortType: sortType, orderBy: orderBy);
}

class DeleteTaskEvent extends TasksEvent {
  final TaskModel taskModel;
  
  DeleteTaskEvent({required this.taskModel});
}

class LoadMoreTaskListEvent extends TasksEvent {
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

class AddNewTaskEvent extends TasksEvent {
  final TaskModel taskModel;

  AddNewTaskEvent({required this.taskModel});
}

class UpdateTaskEvent extends TasksEvent {
  final TaskModel taskModel;

  UpdateTaskEvent({required this.taskModel});
}
