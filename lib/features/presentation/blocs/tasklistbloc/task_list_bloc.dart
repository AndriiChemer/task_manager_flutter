import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_task_manager/core/resources/data_state.dart';
import 'package:flutter_task_manager/features/data/models/models.dart';
import 'package:flutter_task_manager/features/domain/usecases/usecases.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'task_list_event.dart';
part 'task_list_state.dart';

@singleton
class TaskListBloc extends Bloc<TaskListEvent, TaskListState> {

  GetTaskListUseCase getTaskListUseCase;
  DeleteTaskUseCase deleteTaskUseCase;

  TaskListBloc({
    required this.getTaskListUseCase,
    required this.deleteTaskUseCase
  }) : super(TasksInitial());

  int _currentPage = -1;
  int _limit = 0;
  int _count = 0;

  @override
  Stream<TaskListState> mapEventToState(
    TaskListEvent event,
  ) async* {
    if(event is GetTaskListEvent || event is RefreshTaskListEvent) {
      yield* _mapGettingTaskListState(event);
    }

    if(event is LoadMoreTaskListEvent) {
      yield* _mapLoadMoreState(event);
    }

    if(event is DeleteTaskEvent) {
      yield* _mapDeleteTaskState(event);
    }

    if(event is AddNewTaskEvent) {
      yield* _mapAddNewTaskState(event);
    }

    if(event is UpdateTaskEvent) {
      yield* _mapUpdateTaskState(event);
    }
  }

  Stream<TaskListState> _mapGettingTaskListState(TaskListEvent event) async* {
    if(event is GetTaskListEvent) {
      yield TaskListLoadingState(taskList: state.taskList);
    }

    final dataState = await getTaskListUseCase(params: PaginationModel(count: _count, limit: _limit, current: _currentPage));

    if (dataState is DataSuccess) {
      final taskList = dataState.data!.first;
      final paginationModel = dataState.data!.second;

      yield TaskListLoadedSuccessState(taskList: taskList);
    }

    if (dataState is DataFailed) {
      yield TaskListLoadFailState(message: dataState.error.toString());
    }
  }

  Stream<TaskListState> _mapLoadMoreState(LoadMoreTaskListEvent event) async* {}

  Stream<TaskListState> _mapDeleteTaskState(DeleteTaskEvent event) async* {
    final taskList = state.taskList;
    final taskId = event.taskModel.id!;

    yield TaskListLoadingState(taskList: taskList);

    final dataState = await deleteTaskUseCase(params: taskId);

    if (dataState is DataSuccess) {
      taskList.removeWhere((item) => item.id == taskId);
      yield TaskListLoadedSuccessState(taskList: taskList);
    }

    if (dataState is DataFailed) {
      yield TaskListLoadFailState(message: dataState.error.toString());
    }
  }

  Stream<TaskListState> _mapAddNewTaskState(AddNewTaskEvent event) async* {
    final taskModel = event.taskModel;
    final taskList = state.taskList
      ..add(taskModel)
      ..sort((first, second) => first.title.compareTo(second.title));

    yield TaskListLoadedSuccessState(taskList: taskList);
  }

  Stream<TaskListState> _mapUpdateTaskState(UpdateTaskEvent event) async* {
    final updatedTask = event.taskModel;
    final taskList = state.taskList
      ..removeWhere((item) => item.id == updatedTask.id)
      ..add(updatedTask)
      ..sort((first, second) => first.title.compareTo(second.title));

    yield TaskListLoadedSuccessState(taskList: taskList);
  }

  /// =============== Events =================
  void getTasks() {
    add(GetTaskListEvent());
  }

  void loadMore() {
    add(LoadMoreTaskListEvent());
  }

  void onRefresh() {
    add(RefreshTaskListEvent());
  }

  void onDeleteTask(TaskModel? taskModel) {
    if(taskModel != null) {
      add(DeleteTaskEvent(taskModel: taskModel));
    }
  }

  void updateTask(TaskModel taskModel) {
    add(UpdateTaskEvent(taskModel: taskModel));
  }

  void addNewTask(TaskModel taskModel) {
    add(AddNewTaskEvent(taskModel: taskModel));
  }
}
