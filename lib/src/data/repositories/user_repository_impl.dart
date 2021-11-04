import 'package:dio/dio.dart';
import 'package:flutter_task_manager/data/remote/remote.dart';
import 'package:flutter_task_manager/src/core/resources/data_state.dart';
import 'package:flutter_task_manager/src/data/datasources/local/local.dart';
import 'package:flutter_task_manager/src/data/datasources/remote/remote_data_source.dart';
import 'package:flutter_task_manager/src/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {

  final RemoteDataSource _remoteDataSource;
  const UserRepositoryImpl(this._remoteDataSource);

  @override
  Future<DataState<String>> auth(String email, String password) async {
    return _execute(
        email,
        password,
        (userRequest) => _remoteDataSource.authUser(userRequest)
    );
  }

  @override
  Future<DataState<String>> createUser(String email, String password) async {
    return _execute(
        email,
        password,
        (userRequest) => _remoteDataSource.createUser(userRequest)
    );
  }

  Future<DataState<String>> _execute(
      String email,
      String password,
      Future<Response<dynamic>> Function(UserRequest userRequest) callback) async {
    try {

      final userRequest = UserRequest(email: email, password: password);
      final response = await callback(userRequest);

      if (response.statusCode == 200) {
        var token = response.data['token'];
        AuthPreferences.saveToken(token);
        return DataSuccess(token);
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