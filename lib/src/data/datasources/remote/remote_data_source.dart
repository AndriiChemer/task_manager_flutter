import 'package:dio/dio.dart';
import 'package:flutter_task_manager/src/core/params/request.dart';

abstract class RemoteDataSource {

  Future<Response> createUser(UserRequest userRequest);

  Future<Response> authUser(UserRequest userRequest);

  Future<Response> getTaskList(String token, String sortType, String orderBy);

  Future<Response> createTask(String token, TaskRequest taskRequest);

  Future<Response> deleteTask(int taskId, String token);

  Future<Response> updateTask(int taskId, String token, TaskRequest taskRequest);

  Future<Response> getTaskById(int taskId, String token);
}