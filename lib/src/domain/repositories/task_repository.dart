import 'package:flutter_task_manager/src/core/model/pair.dart';
import 'package:flutter_task_manager/src/core/resources/data_state.dart';
import 'package:flutter_task_manager/src/data/models/pagination/pagination_model.dart';
import 'package:flutter_task_manager/src/data/models/task/task_model.dart';

abstract class TaskRepository {
  Future<DataState<Pair<List<TaskModel>, PaginationModel>>> getTaskList();

  Future<DataState<TaskModel>> getTaskById(int taskId);

  Future<DataState<int>> deleteTaskById(int id);

  Future<DataState<TaskModel>> createTask(String title, String description, String priority, int dueBy);

  Future<DataState<bool>> updateTask(int taskId, String title, String description, String priority, int dueBy);
}