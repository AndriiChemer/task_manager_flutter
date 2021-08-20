import 'package:dio/dio.dart';
import 'package:flutter_task_manager/data/local/local.dart';
import 'package:flutter_task_manager/data/remote/remote.dart';
import 'package:flutter_task_manager/data/repository/repository.dart';

class UserRepository with ErrorHandler {
  final Api api;

  UserRepository({required this.api});

  Future<String> createUser(UserRequest userRequest) async {
    try {
      final response = await api.createUser(userRequest);
      var token = response.data['token'];
      AuthPreferences.saveToken(token);
      return token;

    } catch(error) {
      throw getErrorMessage(error);
    }
  }
  
  Future<String> auth(UserRequest userRequest) async {
    try {
      final response = await api.authUser(userRequest);
      var token = response.data['token'];
      AuthPreferences.saveToken(token);
      return token;

    } catch(error) {
      throw getErrorMessage(error);
    }
  }
}
