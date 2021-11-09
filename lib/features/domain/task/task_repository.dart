import 'package:flutter_task_manager/core/model/models.dart';
import 'package:flutter_task_manager/core/params/request.dart';
import 'package:flutter_task_manager/features/domain/task/model/pagination.dart';
import 'package:flutter_task_manager/features/domain/task/model/task.dart';

abstract class TaskRepository {
  Future<Pair<List<Task>, Pagination>> getTaskList();

  Future<Task> getTaskById(int taskId);

  Future<void> deleteTaskById(int id);

  Future<int> createTask(Task task);

  Future<void> updateTask(Task task);
}