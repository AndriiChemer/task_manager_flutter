import 'package:flutter_task_manager/src/data/models/pagination/pagination_model.dart';
import 'package:flutter_task_manager/src/data/models/task/task_model.dart';

class TaskListResponse {
  final List<TaskModel> tasks;
  final PaginationModel pagination;

  TaskListResponse({
    required this.tasks,
    required this.pagination
  });

  factory TaskListResponse.fromJson(Map<String, dynamic> json) {

    var tasks = (json["tasks"] as List<dynamic>).map(
            (element) => TaskModel.fromMapJson(element)
    ).toList();

    return TaskListResponse(
        tasks: tasks,
        pagination: PaginationModel.fromMapJson(json["meta"])
    );
  }
}