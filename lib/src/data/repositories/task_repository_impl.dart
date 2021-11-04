import 'package:dio/dio.dart';
import 'package:flutter_task_manager/src/core/model/pair.dart';
import 'package:flutter_task_manager/src/core/preferences/preferences.dart';
import 'package:flutter_task_manager/src/core/resources/data_state.dart';
import 'package:flutter_task_manager/src/data/datasources/remote/remote_data_source.dart';
import 'package:flutter_task_manager/src/core/params/request.dart';
import 'package:flutter_task_manager/src/data/models/pagination/pagination_model.dart';
import 'package:flutter_task_manager/src/data/models/task/task_model.dart';
import 'package:flutter_task_manager/src/data/models/task_list_response.dart';
import 'package:flutter_task_manager/src/domain/repositories/task_repository.dart';

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