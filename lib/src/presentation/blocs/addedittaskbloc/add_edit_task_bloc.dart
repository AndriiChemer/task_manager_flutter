import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_task_manager/src/core/params/request.dart';
import 'package:flutter_task_manager/src/core/resources/data_state.dart';
import 'package:flutter_task_manager/src/data/models/task/task_model.dart';
import 'package:flutter_task_manager/src/domain/usecases/usecases.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../blocs.dart';

part 'add_edit_task_event.dart';
part 'add_edit_task_state.dart';

@singleton
class AddEditTaskBloc extends Bloc<AddEditTaskEvent, AddEditTaskState> {
  final TaskListBloc tasksBloc;
  final CreateTaskUseCase createTaskUseCase;
  final UpdateTaskUseCase updateTaskUseCase;

  AddEditTaskBloc({
    required this.tasksBloc,
    required this.createTaskUseCase,
    required this.updateTaskUseCase,}) : super(AddEditTaskInitial());

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
    final String title = event.title;
    final String description = event.description;
    final String? priority = event.priority;
    final DateTime? dateTime = event.dateTime;

    final isFieldsNotValid = _isFieldsNotNull(title, description, priority, dateTime);

    if(isFieldsNotValid) {
      yield ValidationTaskFail(message: "fill_in_all_fields");
      return;
    }

    yield AddEditTaskLoading();

    final dateTimeMilliseconds = dateTime!.millisecondsSinceEpoch ~/ 1000;
    final taskRequest = TaskRequest(title: title, dueBy: dateTimeMilliseconds, priority: priority!);
    final dataState = await createTaskUseCase(params: taskRequest);

    if (dataState is DataSuccess) {
      final createdTaskModel = dataState.data!;
      tasksBloc.addNewTask(createdTaskModel);
      yield AddedTaskSuccess();
    }

    if (dataState is DataFailed) {
      yield AddEditTaskFail(message: dataState.error.toString());
    }
  }

  Stream<AddEditTaskState> _mapEditTaskState(EditTaskEvent event) async* {
    TaskModel taskModel = event.taskModel;
    String title = event.title;
    String description = event.description;
    String? priority = event.priority;
    DateTime? dateTime = event.dateTime;

    final isFieldsNotValid = _isFieldsNotNull(title, description, priority, dateTime);

    if(isFieldsNotValid) {
      yield ValidationTaskFail(message: "fill_in_all_fields");
      return;
    }

    final hasNotTaskChanges = _hasNotTaskChanges(taskModel, title, description, priority!, dateTime!);

    if(hasNotTaskChanges) {
      yield ValidationTaskFail(message: "task_does_not_have_changes");
      return;
    }

    yield AddEditTaskLoading();

    final dateTimeMilliseconds = dateTime.millisecondsSinceEpoch ~/ 1000;
    final taskRequest = TaskRequest(id: taskModel.id, title: title, dueBy: dateTimeMilliseconds, priority: priority);
    final dataState = await updateTaskUseCase(params: taskRequest);

    if (dataState is DataSuccess) {
      final updatedTaskModel = TaskModel(id: taskModel.id, title: title, dueBy: dateTimeMilliseconds, priority: priority);
      tasksBloc.updateTask(updatedTaskModel);
      yield AddedTaskSuccess();
      yield EditTaskSuccess(taskModel: updatedTaskModel);
    }

    if (dataState is DataFailed) {
      yield AddEditTaskFail(message: dataState.error.toString());
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
}
