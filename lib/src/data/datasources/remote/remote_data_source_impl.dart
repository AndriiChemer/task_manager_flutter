import 'package:dio/dio.dart';
import 'package:flutter_task_manager/src/data/datasources/remote/requests/task_request.dart';
import 'package:flutter_task_manager/src/data/datasources/remote/requests/user_request.dart';
import 'remote_data_source.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<Response> authUser(UserRequest userRequest) {
    // TODO: implement authUser
    throw UnimplementedError();
  }

  @override
  Future<Response> createTask(String token, TaskRequest taskRequest) {
    // TODO: implement createTask
    throw UnimplementedError();
  }

  @override
  Future<Response> createUser(UserRequest userRequest) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<Response> deleteTask(int taskId, String token) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<Response> getTaskById(int taskId, String token) {
    // TODO: implement getTaskById
    throw UnimplementedError();
  }

  @override
  Future<Response> getTaskList(String token, String sortType, String orderBy) {
    // TODO: implement getTaskList
    throw UnimplementedError();
  }

  @override
  Future<Response> updateTask(int taskId, String token, TaskRequest taskRequest) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }

}