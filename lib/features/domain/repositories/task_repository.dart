import 'package:flutter_task_manager/core/model/models.dart';
import 'package:flutter_task_manager/core/params/request.dart';
import 'package:flutter_task_manager/core/resources/data_state.dart';
import 'package:flutter_task_manager/features/data/models/models.dart';

abstract class TaskRepository {
  Future<DataState<Pair<List<TaskModel>, PaginationModel>>> getTaskList();

  Future<DataState<TaskModel>> getTaskById(int taskId);

  Future<DataState<bool>> deleteTaskById(int id);

  Future<DataState<TaskModel>> createTask(TaskRequest taskRequest);

  Future<DataState<bool>> updateTask(TaskRequest taskRequest);
}