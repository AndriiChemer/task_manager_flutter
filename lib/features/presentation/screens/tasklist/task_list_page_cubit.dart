import 'package:bloc/bloc.dart';
import 'package:flutter_task_manager/features/data/task/api/models/pagination/pagination_response.dart';
import 'package:flutter_task_manager/features/domain/auth/use_case/logout_use_case.dart';
import 'package:flutter_task_manager/features/domain/network/general_connection_error.dart';
import 'package:flutter_task_manager/features/domain/task/model/task.dart';
import 'package:flutter_task_manager/features/domain/task/use_case/delete_task_usecase.dart';
import 'package:flutter_task_manager/features/domain/task/use_case/get_task_list_use_case.dart';
import 'package:flutter_task_manager/features/presentation/widgets/hooks/cubit_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'task_list_page_cubit.freezed.dart';
part 'task_list_page_state.dart';

@Singleton()
class TaskListPageCubit extends Cubit<TaskListPageState> {
  final GetTaskListUseCase _getTaskListUseCase;
  final LogoutUseCase _logoutUseCase;

  int _currentPage = -1;
  int _limit = 0;
  int _count = 0;
  List<Task> _taskList = [];

  TaskListPageCubit(
    this._getTaskListUseCase,
    this._logoutUseCase,
  ) : super(TaskListPageState.initial());

  Future<void> loadFirstPage() async {
    emit(TaskListPageState.loading());

    _limit = 0;
    _count = 0;
    _currentPage = 0;
    _taskList = [];

    try {
      final pair = await _getTaskListUseCase(
        params: PaginationResponse(count: _count, limit: _limit, current: _currentPage)
      );
      final taskList = pair.first;
      final pagination = pair.second;

      _count += pagination.count;
      _limit += pagination.limit;
      _currentPage += pagination.current;
      _taskList = List.from(_taskList)..addAll(taskList);

      emit(TaskListPageState.idle(_taskList, false));
    } on GeneralConnectionError catch (e) {
      emit(TaskListPageState.connectionError(e));
    } catch (e, s) {
      print('Fetching task list failed.\nex: $e\nstacktrace: $s');
      emit(TaskListPageState.empty());
    }
  }

  void loadMode() async {
    emit(TaskListPageState.loading());

    _limit = 0;
    _count = 0;
    _currentPage = 0;
    _taskList = [];

    try {

      final pair = await _getTaskListUseCase(
          params: PaginationResponse(count: _count, limit: _limit, current: _currentPage)
      );
      final taskList = pair.first;
      final pagination = pair.second;

      _count += pagination.count;
      _limit += pagination.limit;
      _currentPage += pagination.current;
      _taskList = List.from(_taskList)..addAll(taskList);

      emit(TaskListPageState.idle(_taskList, false));
    } on GeneralConnectionError catch (e) {
      emit(TaskListPageState.connectionError(e));
    } catch (e, s) {
      print('Fetching task list failed.\nex: $e\nstacktrace: $s');
      emit(TaskListPageState.empty());
    }
  }

  void initial() {
    loadFirstPage();
  }

  void delete(Task task) {
    final taskList = _taskList;
    taskList.removeWhere((item) => item.id == task.id,);

    _count--;
    _taskList = List.from(taskList);

    emit(TaskListPageState.idle(_taskList, false));
  }

  void update(Task task) {
    final taskList = _taskList;

    final updatedTaskList = taskList
      ..removeWhere((item) => item.id == task.id)
      ..add(task)
      ..sort((first, second) => first.title.compareTo(second.title));

    _taskList = List.from(updatedTaskList);

    emit(TaskListPageState.idle(_taskList, false));
  }

  void add(Task task) {
    final taskList = _taskList;

    final updatedTaskList = taskList
      ..add(task)
      ..sort((first, second) => first.title.compareTo(second.title));

    _count++;
    _taskList = List.from(updatedTaskList);

    emit(TaskListPageState.idle(_taskList, false));
  }

  Future<void> logout() async {
    await _logoutUseCase();
    emit(TaskListPageState.signOut());
  }
}
