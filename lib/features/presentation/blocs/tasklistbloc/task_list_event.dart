part of 'task_list_bloc.dart';

@immutable
abstract class TaskListEvent {}

class GetTaskListEvent extends TaskListEvent {}

class RefreshTaskListEvent extends TaskListEvent {}

class DeleteTaskEvent extends TaskListEvent {
  final TaskModel taskModel;
  
  DeleteTaskEvent({required this.taskModel});
}

class LoadMoreTaskListEvent extends TaskListEvent {}

class AddNewTaskEvent extends TaskListEvent {
  final TaskModel taskModel;

  AddNewTaskEvent({required this.taskModel});
}

class UpdateTaskEvent extends TaskListEvent {
  final TaskModel taskModel;

  UpdateTaskEvent({required this.taskModel});
}
