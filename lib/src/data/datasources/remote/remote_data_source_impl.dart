import 'package:dio/dio.dart';
import 'package:flutter_task_manager/src/core/notifiers/notifiers.dart';
import 'package:flutter_task_manager/src/core/params/request.dart';
import 'package:injectable/injectable.dart';
import 'remote_data_source.dart';

@LazySingleton(as: RemoteDataSource)
class RemoteDataSourceImpl implements RemoteDataSource {
  final _dio = Dio();
  final AuthNotifier _authNotifier;

  var _options = Options(
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
      }
  );

  RemoteDataSourceImpl(this._authNotifier) {
    _dio
      ..options.baseUrl = 'https://testapi.doitserver.in.ua/api'
      ..options.receiveTimeout = 15000
      ..options.responseType = ResponseType.json
      ..interceptors.add(CustomInterceptors(_authNotifier))
      ..interceptors.add(LogInterceptor(
        request: false,
        requestBody: true,
        responseBody: true,
        requestHeader: true,
      ));
  }

  ///================USER=================
  @override
  Future<Response> createUser(UserRequest userRequest) =>
      _dio.post('/users', options: _options, data: userRequest.toJson());

  @override
  Future<Response> authUser(UserRequest userRequest) =>
      _dio.post('/auth', options: _options, data: userRequest.toJson());

  ///================TASK=================
  @override
  Future<Response> createTask(String token, TaskRequest taskRequest) {
    _options.headers?["Authorization"] = "Bearer $token";
    return _dio.post('/tasks', options: _options, data: taskRequest.toJson());
  }

  @override
  Future<Response> deleteTask(int taskId, String token) {
    _options.headers?["Authorization"] = "Bearer $token";
    return _dio.delete("/tasks/$taskId", options: _options);
  }

  @override
  Future<Response> getTaskById(int taskId, String token) {
    _options.headers?["Authorization"] = "Bearer $token";
    return _dio.get("/tasks/$taskId", options: _options);
  }

  @override
  Future<Response> getTaskList(String token, String sortType, String orderBy) {
    var query = "/tasks?sort=${sortType.toLowerCase()}%20${orderBy.toLowerCase()}";
    _options.headers?["Authorization"] = "Bearer $token";
    return _dio.get(query, options: _options);
  }

  @override
  Future<Response> updateTask(int taskId, String token, TaskRequest taskRequest) {
    _options.headers?["Authorization"] = "Bearer $token";
    return _dio.put("/tasks/$taskId", options: _options, data: taskRequest.toJson());
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