import 'package:dio/dio.dart';
import 'package:flutter_task_manager/core/model/models.dart';
import 'package:flutter_task_manager/core/params/request.dart';
import 'package:flutter_task_manager/core/preferences/preferences.dart';
import 'package:flutter_task_manager/core/resources/data_state.dart';
import 'package:flutter_task_manager/features/data/datasources/remote/remote_data_source.dart';
import 'package:flutter_task_manager/features/data/models/models.dart';
import 'package:flutter_task_manager/features/domain/repositories/repositories.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TaskRepository)
class TaskRepositoryImpl implements TaskRepository {

  final RemoteDataSource _remoteDataSource;

  const TaskRepositoryImpl(this._remoteDataSource);

  @override
  Future<DataState<TaskModel>> createTask(TaskRequest taskRequest) async {
    try {
      final String token = await AuthPreferences.getToken();
      final response = await _remoteDataSource.createTask(token, taskRequest);

      if (response.statusCode == 200) {
        final taskJson = response.data["task"];

        return DataSuccess(TaskModel.fromMapJson(taskJson));
      }

      return DataFailed(
        DioError(
          error: response.statusMessage,
          response: response,
          type: DioErrorType.response,
          requestOptions: response.requestOptions,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<bool>> deleteTaskById(int id) async {
    try {
      final String token = await AuthPreferences.getToken();
      final response = await _remoteDataSource.deleteTask(id, token);

      if (response.statusCode == 200) {
        return DataSuccess(true);
      }

      return DataFailed(
        DioError(
          error: response.statusMessage,
          response: response,
          type: DioErrorType.response,
          requestOptions: response.requestOptions,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<TaskModel>> getTaskById(int taskId) async {
    try {
      final String token = await AuthPreferences.getToken();
      final response = await _remoteDataSource.getTaskById(taskId, token);

      if (response.statusCode == 200) {
        final taskJson = response.data["task"];

        return DataSuccess(TaskModel.fromMapJson(taskJson));
      }

      return DataFailed(
        DioError(
          error: response.statusMessage,
          response: response,
          type: DioErrorType.response,
          requestOptions: response.requestOptions,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<Pair<List<TaskModel>, PaginationModel>>> getTaskList() async {
    try {
      final String token = await AuthPreferences.getToken();
      final String sortType = await FiltersPreferences.getSortByType();
      final String orderBy = await FiltersPreferences.getOrderByType();
      final response = await _remoteDataSource.getTaskList(token, sortType, orderBy);

      if (response.statusCode == 200) {
        final taskListResponse = TaskListResponse.fromJson(response.data);

        return DataSuccess(Pair(first: taskListResponse.tasks, second: taskListResponse.pagination));
      }

      return DataFailed(
        DioError(
          error: response.statusMessage,
          response: response,
          type: DioErrorType.response,
          requestOptions: response.requestOptions,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<bool>> updateTask(TaskRequest taskRequest) async {
    try {
      final String token = await AuthPreferences.getToken();
      final response = await _remoteDataSource.updateTask(taskRequest.id!, token, taskRequest);

      if (response.statusCode == 200) {
        return DataSuccess(true);
      }

      return DataFailed(
        DioError(
          error: response.statusMessage,
          response: response,
          type: DioErrorType.response,
          requestOptions: response.requestOptions,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

}