import 'package:flutter_task_manager/src/core/resources/data_state.dart';

abstract class UserRepository {
  Future<DataState<String>> createUser(String email, String password);

  Future<DataState<String>> auth(String email, String password);
}