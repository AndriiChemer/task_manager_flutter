import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_task_manager/features/data/models/models.dart';
import 'package:injectable/injectable.dart';

part 'show_task_state.dart';

@injectable
class ShowTaskCubit extends Cubit<ShowTaskState> {
  ShowTaskCubit() : super(ShowTaskInitial());

  void showTaskDetails(TaskModel? taskModel) {
    if(taskModel != null) {
      emit(ShowTaskDetail(taskModel: taskModel));
    }
  }
}
