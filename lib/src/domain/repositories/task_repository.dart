import 'package:flutter_task_manager/src/core/model/pair.dart';
import 'package:flutter_task_manager/src/core/params/request.dart';
import 'package:flutter_task_manager/src/core/resources/data_state.dart';
import 'package:flutter_task_manager/src/data/models/pagination/pagination_model.dart';
import 'package:flutter_task_manager/src/data/models/task/task_model.dart';

abstract class TaskRepository {
  Future<DataState<Pair<List<TaskModel>, PaginationModel>>> getTaskList();

  Future<DataState<TaskModel>> getTaskById(int taskId);

  Future<DataState<bool>> deleteTaskById(int id);

  Future<DataState<TaskModel>> createTask(TaskRequest taskRequest);

  Future<DataState<bool>> updateTask(TaskRequest taskRequest);
}