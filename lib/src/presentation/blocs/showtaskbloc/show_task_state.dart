part of 'show_task_bloc.dart';

@immutable
abstract class TaskState {}

class TaskInitial extends TaskState {}

class ShowTaskState extends TaskState {
  final TaskModel taskModel;

  ShowTaskState({required this.taskModel});
}

class LoadingTaskState extends TaskState {}

class FailLoadTaskState extends TaskState {
  final String message;

  FailLoadTaskState({required this.message});
}
