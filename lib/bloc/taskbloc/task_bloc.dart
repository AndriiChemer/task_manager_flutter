import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_task_manager/data/models/models.dart';
import 'package:meta/meta.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {

  TaskBloc() : super(TaskInitial());

  @override
  Stream<TaskState> mapEventToState(
    TaskEvent event,
  ) async* {
    if(event is ShowTaskEvent) {
      yield ShowTaskState(taskModel: event.taskModel);
    }
  }

  void showTaskDetails(TaskModel? taskModel) {
    if(taskModel != null) {
      add(ShowTaskEvent(taskModel: taskModel));
    }
  }
}
