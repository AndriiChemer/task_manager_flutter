import 'package:flutter_task_manager/data/local/local.dart';
import 'package:flutter_task_manager/data/remote/remote.dart';
import 'package:flutter_task_manager/data/repository/repository.dart';

class TaskRepository with ErrorHandler {
  final Api api;

  TaskRepository({required this.api});

  Future<TaskListResponse> getTaskList(String sortType, String orderBy) async {
    try {
      final String token = await AuthPreferences.getToken();
      final response = await api.getTaskList(token, sortType, orderBy);

      return TaskListResponse.fromJson(response.data);
    } catch(error) {
      throw getErrorMessage(error);
    }
  }

  Future<int> deleteTaskById(int id) async {
    try {
      final String token = await AuthPreferences.getToken();
      await api.deleteTask(id, token);

      return id;
    } catch(error) {
      throw getErrorMessage(error);
    }
  }

  Future<TaskResponse> createTask(String title, String description, String priority, int dueBy) async {
    try {
      final String token = await AuthPreferences.getToken();
      final TaskRequest taskRequest = TaskRequest(title: title, priority: priority, dueBy: dueBy);
      var response = await api.createTask(token, taskRequest);
      var taskResponseJson = response.data["task"];

      return TaskResponse.fromJson(taskResponseJson);
    } catch(error) {
      throw getErrorMessage(error);
    }
  }

  Future<void> updateTask(int taskId, String title, String description, String priority, int dueBy) async {
    try {
      final String token = await AuthPreferences.getToken();
      final TaskRequest taskRequest = TaskRequest(title: title, priority: priority, dueBy: dueBy);
      await api.updateTask(taskId, token, taskRequest);
    } catch(error) {
      throw getErrorMessage(error);
    }
  }
}