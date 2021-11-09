import 'package:dio/dio.dart';
import 'package:flutter_task_manager/core/params/user_request.dart';
import 'package:flutter_task_manager/features/data/auth/api/model/token_response.dart';
import 'package:flutter_task_manager/features/data/network/task_manager_dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'auth_api_data_source.g.dart';

@Singleton()
@RestApi()
abstract class AuthApiDataSource {
  @factoryMethod
  factory AuthApiDataSource(TaskManagerDio dio) = _AuthApiDataSource;

  @POST('/api/users')
  Future<TokenResponse> createUser(@Body() UserRequest userRequest);

  @POST('/api/auth')
  Future<TokenResponse> authUser(@Body() UserRequest userRequest);
}