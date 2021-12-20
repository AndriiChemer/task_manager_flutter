import 'package:bloc/bloc.dart';
import 'package:flutter_task_manager/features/domain/network/general_connection_error.dart';
import 'package:flutter_task_manager/features/domain/task/model/task.dart';
import 'package:flutter_task_manager/features/presentation/screens/tasklist/task_list_page_cubit.dart';
import 'package:flutter_task_manager/features/domain/task/use_case/create_task_usecase.dart';
import 'package:flutter_task_manager/features/domain/task/use_case/update_task_usecase.dart';
import 'package:flutter_task_manager/features/presentation/widgets/hooks/cubit_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'add_edit_task_page_state.dart';
part 'add_edit_task_page_cubit.freezed.dart';

enum TaskValid { titleValidation, descriptionValidation, priorityValidation, dueByValidation }

@Injectable()
class AddEditTaskPageCubit extends Cubit<AddEditTaskPageState> {
  final CreateTaskUseCase createTaskUseCase;
  final UpdateTaskUseCase updateTaskUseCase;
  final TaskListPageCubit _taskListPageCubit;

  Task _task = Task();
  Set<TaskValid> _errors = Set<TaskValid>();
  bool _shouldEmitValidationDuringTyping = false;

  AddEditTaskPageCubit(
      this.createTaskUseCase,
      this.updateTaskUseCase,
      this._taskListPageCubit) : super(AddEditTaskPageState.initial());

  Future<void> updateTitle(String title) async {
    _task = _task.copyWith(title: title);

    _buildIdleState();
  }

  Future<void> updateDescription(String description) async {
    _buildIdleState();
  }

  Future<void> updatePriority(String priority) async {
    _task = _task.copyWith(priority: priority);
    _buildIdleState();
  }

  Future<void> updateDateTime(int dueBy) async {
    _task = _task.copyWith(dueBy: dueBy);
    _buildIdleState();
  }

  /// =============================

  Future<void> addTask() async {
    if(!_shouldEmitValidationDuringTyping) {
      _shouldEmitValidationDuringTyping = !_shouldEmitValidationDuringTyping;
    }

    await _buildIdleState();

    if(_errors.isNotEmpty) {
      return;
    }

    try {
      emit(AddEditTaskPageState.loading());

      final id = await createTaskUseCase(params: _task);
      _task = _task.copyWith(id: id);
      _taskListPageCubit.add(_task);

      emit(AddEditTaskPageState.addingSuccess());
    } on GeneralConnectionError catch(e) {
      emit(AddEditTaskPageState.connectionError(e));
    } catch (e, s) {
      print('Adding task failed.\nex: $e\nstacktrace: $s');
      emit(AddEditTaskPageState.error());
    }
  }

  Future<void> editTask(Task oldTask) async {
    if(!_shouldEmitValidationDuringTyping) {
      _shouldEmitValidationDuringTyping = !_shouldEmitValidationDuringTyping;
    }

    final hasNotChanges = oldTask.title == _task.title &&
        oldTask.priority == _task.priority &&
        oldTask.dueBy == _task.dueBy;

    if(hasNotChanges) {
      emit(AddEditTaskPageState.editingSuccess(oldTask));
      return;
    }

    await _buildIdleState();

    if(_errors.isNotEmpty) {
      return;
    }

    try {
      await updateTaskUseCase(params: _task);
      _taskListPageCubit.update(_task);
      emit(AddEditTaskPageState.editingSuccess(_task));
    } on GeneralConnectionError catch(e) {
      emit(AddEditTaskPageState.connectionError(e));
    } catch (e, s) {
      print('Adding task failed.\nex: $e\nstacktrace: $s');
      emit(AddEditTaskPageState.error());
    }
  }

  Future<void> _buildIdleState() async {
    /// Title
    if(_task.title.isEmpty) {
      _errors.add(TaskValid.titleValidation);
    } else if(_task.title.isNotEmpty && _errors.contains(TaskValid.titleValidation)) {
      _errors.remove(TaskValid.titleValidation);
    }

    /// Priority
    if(_task.priority.isEmpty) {
      _errors.add(TaskValid.priorityValidation);
    } else if(_errors.contains(TaskValid.priorityValidation)) {
      _errors.remove(TaskValid.priorityValidation);
    }

    /// dueBy
    if(_task.dueBy == 0) {
      _errors.add(TaskValid.dueByValidation);
    } else if(_errors.contains(TaskValid.dueByValidation)) {
      _errors.remove(TaskValid.dueByValidation);
    }

    if(_shouldEmitValidationDuringTyping) {
      Set<TaskValid> errors = Set<TaskValid>()..addAll(_errors);
      emit(AddEditTaskPageState.idle(errors));
    }
  }

  void initial(Task? task) {
    if(task != null) {
      _task = task;
    }
  }
}

