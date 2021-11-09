

import 'package:flutter_task_manager/core/params/request.dart';
import 'package:flutter_task_manager/core/resources/data_state.dart';

abstract class AuthRepository {
  Future<String> createUser(UserRequest userRequest);

  Future<String> auth(UserRequest userRequest);
}