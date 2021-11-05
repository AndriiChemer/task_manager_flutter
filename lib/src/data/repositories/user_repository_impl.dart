import 'package:dio/dio.dart';
import 'package:flutter_task_manager/src/core/preferences/preferences.dart';
import 'package:flutter_task_manager/src/core/resources/data_state.dart';
import 'package:flutter_task_manager/src/data/datasources/remote/remote_data_source.dart';
import 'package:flutter_task_manager/src/core/params/request.dart';
import 'package:flutter_task_manager/src/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {

  final RemoteDataSource _remoteDataSource;
  const UserRepositoryImpl(this._remoteDataSource);

  @override
  Future<DataState<String>> auth(UserRequest userRequest) async {
    return _execute(
        () => _remoteDataSource.authUser(userRequest)
    );
  }

  @override
  Future<DataState<String>> createUser(UserRequest userRequest) async {
    return _execute(
        () => _remoteDataSource.createUser(userRequest)
    );
  }

  Future<DataState<String>> _execute(
      Future<Response<dynamic>> Function() callback) async {
    try {

      final response = await callback();

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