import 'package:flutter_task_manager/core/params/request.dart';
import 'package:flutter_task_manager/core/preferences/preferences.dart';
import 'package:flutter_task_manager/features/data/auth/api/auth_api_data_source.dart';
import 'package:flutter_task_manager/features/data/network/error/dio_error_resolver.dart';
import 'package:flutter_task_manager/features/domain/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class UserRepositoryImpl implements AuthRepository {

  final AuthApiDataSource _authApiDataSource;
  final AuthStorageImpl _authStorage;

  const UserRepositoryImpl(this._authApiDataSource, this._authStorage);

  @override
  Future<String> auth(UserRequest userRequest) async {

    final response = await callWithDioErrorResolver(
      () => _authApiDataSource.authUser(userRequest)
    );

    _authStorage.saveToken(response.token);

    return response.token;
  }

  @override
  Future<String> createUser(UserRequest userRequest) async {
    final response = await callWithDioErrorResolver(
      () => _authApiDataSource.createUser(userRequest)
    );

    _authStorage.saveToken(response.token);

    return response.token;
  }
}