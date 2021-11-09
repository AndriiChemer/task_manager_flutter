import 'package:flutter_task_manager/features/data/common/data_mapper.dart';
import 'package:flutter_task_manager/features/domain/task/model/task.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'task_response.g.dart';

@JsonSerializable(createToJson: true)
class TaskResponse  {
  final int? id;
  final String title;
  final int dueBy;
  final String priority;




  TaskResponse({

    this.id,
    required this.title,
    required this.dueBy,
    required this.priority,

  });



  factory TaskResponse.fromJson(Map<String, dynamic> map)
      => _$TaskResponseFromJson(map);




  Map<String, dynamic> toJson() => _$TaskResponseToJson(this);
}

@Injectable()
class TaskMapper implements DataMapper<TaskResponse, Task> {
  @override
  Task call(TaskResponse data) =>
      Task(
        id: data.id != null ? int.tryParse(data.id!) : null,
        title: data.title,
        dueBy: data.dueBy,
        priority: data.priority
      );
}