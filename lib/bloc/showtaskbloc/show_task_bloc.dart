import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_task_manager/data/models/models.dart';
import 'package:meta/meta.dart';

part 'show_task_event.dart';
part 'show_task_state.dart';

class ShowTaskBloc extends Bloc<ShowTaskEvent, TaskState> {

  ShowTaskBloc() : super(TaskInitial());

  @override
  Stream<TaskState> mapEventToState(
      ShowTaskEvent event,
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
