import 'package:flutter_task_manager/src/core/params/request.dart';
import 'package:flutter_task_manager/src/core/resources/data_state.dart';

abstract class UserRepository {
  Future<DataState<String>> createUser(UserRequest userRequest);

  Future<DataState<String>> auth(UserRequest userRequest);
}