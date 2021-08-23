import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_task_manager/core/converters/converters.dart';
import 'package:flutter_task_manager/data/repository/repository.dart';
import 'package:flutter_task_manager/data/models/models.dart';
import 'package:meta/meta.dart';

part 'task_list_event.dart';
part 'task_list_state.dart';

class TaskListBloc extends Bloc<TaskListEvent, TaskListState> {

  final TaskRepository taskRepository;
  final FiltersRepository filtersRepository;
  final Converter taskListConverter;

  TaskListBloc({required this.taskRepository, required this.filtersRepository, required this.taskListConverter}) : super(TasksInitial());

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
    int currentPage = -1;
    int limit = 0;
    int count = 0;
    List<TaskModel> tasks = state.taskList;

    try {
      if(event is GetTaskListEvent) {
        yield TaskListLoadingState(
            taskList: tasks ,
            currentPage: currentPage,
            limit: limit,
            count: count);
      }

      var sortType = event.sortType;
      var orderBy = event.orderBy;
      var taskListResponse = await taskRepository.getTaskList(sortType, orderBy);

      tasks = taskListConverter.convert(taskListResponse.tasks) as List<TaskModel>;
      currentPage = taskListResponse.meta.current;
      limit = taskListResponse.meta.limit;
      count = taskListResponse.meta.count;

      yield TaskListLoadedSuccessState(
          taskList: tasks,
          currentPage: currentPage,
          limit: limit,
          count: count);

    } catch(error) {
      yield TaskListLoadFailState(
          message: error.toString(),
          currentPage: currentPage,
          limit: limit,
          count: count,
          taskList: tasks);
    }
  }

  Stream<TaskListState> _mapLoadMoreState(LoadMoreTaskListEvent event) async* {
    var nextPage = event.currentPage + 1;

    // if(totalPage >= nextPage) {
    //   try {
    //     yield TaskListPaginationLoadingState();
    //
    //     // var taskList = taskRepository
    //
    //
    //     yield TaskListLoadedSuccessState();
    //   } catch(error) {
    //     yield TaskListLoadFailState(error.toString());
    //   }
    // }
  }

  Stream<TaskListState> _mapDeleteTaskState(DeleteTaskEvent event) async* {
    List<TaskModel> tasks = state.taskList;
    int currentPage = state.currentPage;
    int limit = state.limit;
    int count = state.count;

    try {
      yield TaskListLoadingState(
          taskList: tasks ,
          currentPage: currentPage,
          limit: limit,
          count: count);


      var taskId = event.taskModel.id;
      var removedTaskId = await taskRepository.deleteTaskById(taskId);
      tasks.removeWhere((item) => item.id == removedTaskId);


      yield TaskListLoadedSuccessState(
          taskList: tasks,
          currentPage: currentPage,
          limit: limit,
          count: count);

    } catch(error) {
      yield TaskListLoadFailState(
          message: error.toString(),
          currentPage: currentPage,
          limit: limit,
          count: count,
          taskList: tasks);
    }
  }

  Stream<TaskListState> _mapAddNewTaskState(AddNewTaskEvent event) async* {
    var taskModel = event.taskModel;
    var taskList = state.taskList;
    taskList.add(taskModel);

    taskList.sort((first, second) => first.title.compareTo(second.title));

    yield TaskListLoadedSuccessState(
        taskList: taskList,
        currentPage: state.currentPage,
        limit: state.limit,
        count: state.count);
  }

  Stream<TaskListState> _mapUpdateTaskState(UpdateTaskEvent event) async* {
    var taskModel = event.taskModel;
    var taskList = state.taskList;

    taskList.forEach((item) {
      if(item.id == taskModel.id) {
        item.title = taskModel.title;
        item.priority = taskModel.priority;
      }
    });

    taskList.sort((first, second) => first.title.compareTo(second.title));

    yield TaskListLoadedSuccessState(
        taskList: taskList,
        currentPage: state.currentPage,
        limit: state.limit,
        count: state.count);
  }

  /// =============== Events =================
  void getTasks() {
    var sortBy = "title";
    var orderBy = "asc";
    add(GetTaskListEvent(sortBy, orderBy));
  }

  void loadMore() {
    var sortBy = "title";
    var orderBy = "asc";
    var currentPage = state.currentPage;
    var limit = state.limit;
    var count = state.limit;

    add(LoadMoreTaskListEvent(
      sortType: sortBy,
      orderBy: orderBy,
      currentPage: currentPage,
      limit: limit,
      count: count
    ));
  }

  void onRefresh() {
    var sortBy = "title";
    var orderBy = "asc";
    add(RefreshTaskListEvent(sortBy, orderBy));
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
