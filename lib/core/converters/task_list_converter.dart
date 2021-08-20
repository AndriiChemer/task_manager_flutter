import 'package:flutter_task_manager/data/remote/remote.dart';
import 'package:flutter_task_manager/data/models/models.dart';

import 'converter.dart';

class TaskListConverter implements Converter<List<TaskResponse>, List<TaskModel>> {
  @override
  List<TaskModel> convert(List<TaskResponse> model) {
    return model.map((item) =>
        TaskModel(
            id: item.id,
            dueBy: item.dueBy,
            title: item.title,
            priority: item.priority)).toList();
  }
}