part of 'add_edit_task_bloc.dart';

@immutable
abstract class AddEditTaskEvent {
  final String? title;
  final String? description;
  final String? priority;
  final DateTime? dateTime;

  AddEditTaskEvent({required this.title, required this.description, this.priority, this.dateTime});
}

class AddTaskEvent extends AddEditTaskEvent {

  AddTaskEvent({
    required String? title,
    required String? description,
    required String? priority,
    required DateTime? dateTime})
      : super(
          title: title,
          description: description,
          priority: priority,
          dateTime: dateTime);
}

class EditTaskEvent extends AddEditTaskEvent {

  final TaskModel taskModel;

  EditTaskEvent({
    required this.taskModel,
    required String? title,
    required String? description,
    required String? priority,
    required DateTime? dateTime})
      : super(
      title: title,
      description: description,
      priority: priority,
      dateTime: dateTime);
}