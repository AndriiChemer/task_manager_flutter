part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class ShowTaskEvent extends TaskEvent {
  final TaskModel taskModel;

  ShowTaskEvent({required this.taskModel});
}

class GetTaskByIdEvent extends TaskEvent {
  final int taskId;

  GetTaskByIdEvent({required this.taskId});
}
