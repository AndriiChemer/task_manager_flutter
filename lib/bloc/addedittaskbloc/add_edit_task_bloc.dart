import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_task_manager/bloc/blocs.dart';
import 'package:flutter_task_manager/data/converters/converters.dart';
import 'package:flutter_task_manager/data/remote/remote.dart';
import 'package:flutter_task_manager/data/repository/repository.dart';
import 'package:flutter_task_manager/ui/models/models.dart';
import 'package:meta/meta.dart';

part 'add_edit_task_event.dart';
part 'add_edit_task_state.dart';

class AddEditTaskBloc extends Bloc<AddEditTaskEvent, AddEditTaskState> {
  final TasksBloc tasksBloc;
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
    String? description = event.description;
    String? priority = event.priority;
    DateTime? dateTime = event.dateTime;

    var isFieldsNotValid = _isFieldsNotNull(title, description, priority, dateTime);

    if(isFieldsNotValid) {
      yield ValidationTaskFail(message: "Please select all fields");
      return;
    }

    try {
      yield AddEditTaskLoading();

      var dateTimeMilliseconds = dateTime!.millisecondsSinceEpoch ~/ 1000;
      print("ANDRII: $dateTimeMilliseconds");

      TaskResponse taskResponse = await taskRepository.createTask(title!, 'description', priority!, dateTimeMilliseconds);
      TaskModel taskModel = taskConverter.convert(taskResponse);
      tasksBloc.addNewTask(taskModel);

      yield AddedTaskSuccess();
    } catch(error) {
      yield ValidationTaskFail(message: error.toString());
    }
  }

  Stream<AddEditTaskState> _mapEditTaskState(EditTaskEvent event) async* {
    TaskModel taskModel = event.taskModel;
    String? title = event.title;
    String? description = event.description;
    String? priority = event.priority;
    DateTime? dateTime = event.dateTime;


  }

  bool _isFieldsNotNull(String? title, String? description, String? priority, DateTime? dateTime) {
    return title == null ||
        priority == null ||
        dateTime == null ||
        title.isEmpty ||
        priority.isEmpty;
  }

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
