import 'package:dio/dio.dart';
import 'package:flutter_task_manager/core/notifiers/auth_notifier.dart';
import 'package:flutter_task_manager/data/remote/remote.dart';

import 'api.dart';

const String BASE_URL = '​https://testapi.doitserver.in.ua/api';
///PATHs
const String CREATE_USER = '/users';
const String AUTH_USER = '/auth';
const String GET_TASK_LIST = '/tasks';
const String CREATE_TASK = GET_TASK_LIST;
const String GET_TASK_DETAILS = GET_TASK_LIST;
const String DELETE_TASK = GET_TASK_LIST;
const String UPDATE_TASK = GET_TASK_LIST;

class ApiProvider implements Api {
  static final dio = Dio();

  var options = Options(
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
      }
  );

  factory ApiProvider([AuthNotifier? authNotifier]) {
    return ApiProvider._initialize(authNotifier);
  }

  ApiProvider._initialize([AuthNotifier? authNotifier]) {
    dio
      ..options.baseUrl = 'https://testapi.doitserver.in.ua/api'
      ..options.receiveTimeout = 15000
      ..options.responseType = ResponseType.json
      ..interceptors.add(CustomInterceptors(authNotifier))
      ..interceptors.add(LogInterceptor(
        request: false,
        requestBody: true,
        responseBody: true,
        requestHeader: true,
      ));
  }

  /// ==================USER API========================
  @override
  Future<Response> createUser(UserRequest userRequest) async {
    return await dio.post(CREATE_USER, options: options, data: userRequest.toJson());
  }

  @override
  Future<Response> authUser(UserRequest userRequest) async {
    return await dio.post(AUTH_USER, options: options, data: userRequest.toJson());
  }

  /// ==================TASK API========================
  @override
  Future<Response> getTaskList(String token, String sortType, String orderBy) async { // sortType = title, orderBy = asc
    var query = "$GET_TASK_LIST?sort=$sortType%20$orderBy";
    options.headers?["Authorization"] = "Bearer $token";
    return await dio.get(query, options: options);
  }

  @override
  Future<Response> createTask(String token, TaskRequest taskRequest) async {
    options.headers?["Authorization"] = "Bearer $token";
    return await dio.post(CREATE_TASK, options: options, data: taskRequest.toJson());
  }

  @override
  Future<Response> getTaskById(int taskId, String token) async {
    options.headers?["Authorization"] = "Bearer $token";
    return await dio.get("$GET_TASK_DETAILS/$taskId", options: options);
  }

  @override
  Future<Response> deleteTask(int taskId, String token) async {
    options.headers?["Authorization"] = "Bearer $token";
    return await dio.delete("$DELETE_TASK/$taskId", options: options);
  }

  @override
  Future<Response> updateTask(int taskId, String token, TaskRequest taskRequest) async {
    options.headers?["Authorization"] = "Bearer $token";
    return await dio.put("$UPDATE_TASK/$taskId", options: options, data: taskRequest.toJson());
  }
}

class CustomInterceptors extends Interceptor {
  final AuthNotifier? authNotifier;
  CustomInterceptors([this.authNotifier]);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

@override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    var response = err.response;
    if(response != null) {
      var isUnauthorizedCode = response.statusCode == 401;

      if(isUnauthorizedCode) {
        authNotifier?.setUserAuthorization(false);
      }
    }

    super.onError(err, handler);
  }
}