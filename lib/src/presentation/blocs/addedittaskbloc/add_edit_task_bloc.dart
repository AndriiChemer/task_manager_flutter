import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_task_manager/data/remote/remote.dart';
import 'package:flutter_task_manager/data/repository/repository.dart';
import 'package:flutter_task_manager/data/models/models.dart';
import 'package:flutter_task_manager/src/core/converter/converter.dart';
import 'package:meta/meta.dart';

import '../blocs.dart';

part 'add_edit_task_event.dart';
part 'add_edit_task_state.dart';

class AddEditTaskBloc extends Bloc<AddEditTaskEvent, AddEditTaskState> {
  final TaskListBloc tasksBloc;
  final Converter taskConverter;
  final TaskRepository taskRepository;

  AddEditTaskBloc({required this.tasksBloc, required this.taskRepository, required this.taskConverter,}) : super(AddEditTaskInitial());

  @override
  Stream<AddEditTaskState> mapEventToState(
    AddEditTaskEvent event,
  ) async* {
    if(event is AddTaskEvent) {
      yield* _mapAddTaskState(event);
    }

    if(event is EditTaskEvent) {
      yield* _mapEditTaskState(event);
    }
  }

  Stream<AddEditTaskState> _mapAddTaskState(AddTaskEvent event) async* {
    String? title = event.title;
    String? description = event.description ?? '';
    String? priority = event.priority;
    DateTime? dateTime = event.dateTime;

    var isFieldsNotValid = _isFieldsNotNull(title, description, priority, dateTime);

    if(isFieldsNotValid) {
      yield ValidationTaskFail(message: "fill_in_all_fields");
      return;
    }

    try {
      yield AddEditTaskLoading();

      var dateTimeMilliseconds = dateTime!.millisecondsSinceEpoch ~/ 1000;

      TaskResponse taskResponse = await taskRepository.createTask(title!, description, priority!, dateTimeMilliseconds);
      TaskModel taskModel = taskConverter.convert(taskResponse);
      tasksBloc.addNewTask(taskModel);

      yield AddedTaskSuccess();
    } catch(error) {
      yield AddEditTaskFail(message: error.toString());
    }
  }

  Stream<AddEditTaskState> _mapEditTaskState(EditTaskEvent event) async* {
    TaskModel taskModel = event.taskModel;
    String? title = event.title;
    String? description = event.description ?? '';
    String? priority = event.priority;
    DateTime? dateTime = event.dateTime;

    var isFieldsNotValid = _isFieldsNotNull(title, description, priority, dateTime);
    

    if(isFieldsNotValid) {
      yield ValidationTaskFail(message: "fill_in_all_fields");
      return;
    }

    var hasNotTaskChanges = _hasNotTaskChanges(taskModel, title!, description, priority!, dateTime!);
    if(hasNotTaskChanges) {
      yield ValidationTaskFail(message: "task_does_not_have_changes");
      return;
    }

    try {
      yield AddEditTaskLoading();

      var dateTimeMilliseconds = dateTime.millisecondsSinceEpoch ~/ 1000;
      var taskId = taskModel.id;

      await taskRepository.updateTask(taskId, title, description, priority, dateTimeMilliseconds);
      TaskResponse taskResponse = await taskRepository.getTaskById(taskId);
      TaskModel newTaskModel = taskConverter.convert(taskResponse);
      tasksBloc.updateTask(newTaskModel);

      yield EditTaskSuccess(taskModel: newTaskModel);
    } catch(error) {
      yield AddEditTaskFail(message: error.toString());
    }
  }

  bool _isFieldsNotNull(String? title, String? description, String? priority, DateTime? dateTime) {
    return title == null ||
        priority == null ||
        dateTime == null ||
        title.isEmpty ||
        priority.isEmpty;
  }

  bool _hasNotTaskChanges(TaskModel taskModel, String title, String description, String priority, DateTime dateTime) {
    var newDateTimeSeconds = dateTime.millisecondsSinceEpoch ~/ 1000;
    return taskModel.title == title && taskModel.priority == priority && taskModel.dueBy == newDateTimeSeconds;
  }

  /// ================= EVENTS ====================
  void onAddTaskClick(String? title, String? description, String? priority, DateTime? dateTime) {
    add(AddTaskEvent(
        title: title,
        description: description,
        priority: priority,
        dateTime: dateTime));
  }

  void onEditTaskClick(TaskModel taskModel, String? title, String? description, String? priority, DateTime? dateTime) {
    add(EditTaskEvent(
      taskModel: taskModel,
      title: title,
      description: description,
      priority: priority,
      dateTime: dateTime));
  }
}
