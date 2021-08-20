part of 'add_edit_task_bloc.dart';

@immutable
abstract class AddEditTaskState {}

class AddEditTaskInitial extends AddEditTaskState {}

class AddEditTaskLoading extends AddEditTaskState {}

class ValidationTaskFail extends AddEditTaskState {
  final String message;

  ValidationTaskFail({required this.message});
}

class AddedTaskSuccess extends AddEditTaskState {}

class EditTaskSuccess extends AddEditTaskState {}

class AddEditTaskFail extends AddEditTaskState {
  final String message;

  AddEditTaskFail({required this.message});
}
