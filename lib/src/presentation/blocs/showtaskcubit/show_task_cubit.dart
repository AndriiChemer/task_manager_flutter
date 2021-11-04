import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_task_manager/src/data/models/task/task_model.dart';

part 'show_task_state.dart';

class ShowTaskCubit extends Cubit<ShowTaskState> {
  ShowTaskCubit() : super(ShowTaskInitial());

  void showTaskDetails(TaskModel? taskModel) {
    if(taskModel != null) {
      emit(ShowTaskDetail(taskModel: taskModel));
    }
  }
}
