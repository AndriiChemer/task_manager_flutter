import 'package:bloc/bloc.dart';
import 'package:flutter_task_manager/features/domain/network/general_connection_error.dart';
import 'package:flutter_task_manager/features/domain/task/model/task.dart';
import 'package:flutter_task_manager/features/domain/task/use_case/delete_task_usecase.dart';
import 'package:flutter_task_manager/features/presentation/screens/tasklist/task_list_page_cubit.dart';
import 'package:flutter_task_manager/features/presentation/widgets/hooks/cubit_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'task_details_page_state.dart';
part 'task_details_page_cubit.freezed.dart';

@Injectable()
class TaskDetailsPageCubit extends Cubit<TaskDetailsPageState> {
  final TaskListPageCubit _taskListPageCubit;
  final DeleteTaskUseCase _deleteTaskUseCase;
  TaskDetailsPageCubit(this._deleteTaskUseCase, this._taskListPageCubit) : super(TaskDetailsPageState.initial());

  Future<void> delete(Task task) async {
    emit(TaskDetailsPageState.loading());

    try {
      await _deleteTaskUseCase(params: task.id!);
      _taskListPageCubit.delete(task);
      emit(TaskDetailsPageState.success());
    } on GeneralConnectionError catch (e) {
      emit(TaskDetailsPageState.connectionError(e));
      emit(TaskDetailsPageState.idle());
    } catch (e, s) {
      print('Fetching task list failed.\nex: $e\nstacktrace: $s');
      emit(TaskDetailsPageState.error());
      emit(TaskDetailsPageState.idle());
    }
  }
}
