import 'package:flutter_task_manager/core/model/models.dart';
import 'package:flutter_task_manager/core/params/request.dart';
import 'package:flutter_task_manager/core/preferences/preferences.dart';
import 'package:flutter_task_manager/features/data/network/error/dio_error_resolver.dart';
import 'package:flutter_task_manager/features/data/task/api/models/pagination/pagination_response.dart';
import 'package:flutter_task_manager/features/data/task/api/models/task/task_response.dart';
import 'package:flutter_task_manager/features/data/task/api/task_api_data_source.dart';
import 'package:flutter_task_manager/features/domain/task/model/pagination.dart';
import 'package:flutter_task_manager/features/domain/task/model/task.dart';
import 'package:flutter_task_manager/features/domain/task/task_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TaskRepository)
class TaskRepositoryImpl implements TaskRepository {

  final TaskApiDataSource _taskApiDataSource;
  final PaginationMapper _paginationMapper;
  final TaskMapper _taskMapper;
  final FiltersPreferences _filtersPreferences;

  const TaskRepositoryImpl(
      this._taskApiDataSource,
      this._filtersPreferences,
      this._taskMapper,
      this._paginationMapper);

  @override
  Future<int> createTask(Task task) async {
    final taskRequest = TaskRequest(title: task.title, dueBy: task.dueBy, priority: task.priority);
    final taskResponse = await callWithDioErrorResolver(
      () => _taskApiDataSource.createTask(taskRequest)
    );

    final newTask = _taskMapper(taskResponse.task);
    return newTask.id!;
  }

  @override
  Future<void> deleteTaskById(int id) async {
    await callWithDioErrorResolver(
      () => _taskApiDataSource.deleteTask(id)
    );
  }

  @override
  Future<Task> getTaskById(int taskId) async {
    final taskResponse = await callWithDioErrorResolver(
      () => _taskApiDataSource.getTaskById(taskId)
    );

    final tasks = _taskMapper(taskResponse);
    return tasks;
  }

  @override
  Future<Pair<List<Task>, Pagination>> getTaskList() async {
    final String sortType = await _filtersPreferences.getSortByType();
    final String orderBy = await _filtersPreferences.getOrderByType();
    final response = await callWithDioErrorResolver(
      () => _taskApiDataSource.getTaskList(sortType, orderBy)
    );

    final taskList = response.tasks.map((item) => _taskMapper(item)).toList();
    final pagination = _paginationMapper(response.pagination);

    return Pair<List<Task>, Pagination>(first: taskList, second: pagination);
  }

  @override
  Future<void> updateTask(Task task) async {
    final taskRequest = TaskRequest(id: task.id, title: task.title, dueBy: task.dueBy, priority: task.priority);
    await callWithDioErrorResolver(
      () => _taskApiDataSource.updateTask(taskRequest.id!, taskRequest)
    );
  }
}