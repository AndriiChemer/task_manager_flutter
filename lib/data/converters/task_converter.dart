import 'package:flutter_task_manager/data/converters/converters.dart';
import 'package:flutter_task_manager/data/remote/remote.dart';
import 'package:flutter_task_manager/ui/models/models.dart';

class TaskConverter implements Converter<TaskResponse, TaskModel> {
  @override
  TaskModel convert(TaskResponse model) {
    return TaskModel(
        id: model.id,
        dueBy: model.dueBy,
        title: model.title,
        priority: model.priority);
  }
}