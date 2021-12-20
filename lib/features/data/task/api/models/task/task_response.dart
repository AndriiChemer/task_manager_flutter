import 'package:flutter_task_manager/features/data/common/data_mapper.dart';
import 'package:flutter_task_manager/features/domain/task/model/task.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'task_response.g.dart';

@JsonSerializable(createToJson: true)
class TaskResponseDTO  {
  final TaskDTO task;

  TaskResponseDTO(this.task);

  factory TaskResponseDTO.fromJson(Map<String, dynamic> map)
  => _$TaskResponseDTOFromJson(map);

  Map<String, dynamic> toJson() => _$TaskResponseDTOToJson(this);
}

@JsonSerializable(createToJson: true)
class TaskDTO  {
  final int? id;
  final String title;
  final int dueBy;
  final String priority;

  TaskDTO({
    this.id,
    required this.title,
    required this.dueBy,
    required this.priority,
  });

  factory TaskDTO.fromJson(Map<String, dynamic> map) => _$TaskDTOFromJson(map);

  Map<String, dynamic> toJson() => _$TaskDTOToJson(this);
}

@Injectable()
class TaskMapper implements DataMapper<TaskDTO, Task> {
  @override
  Task call(TaskDTO data) =>
      Task(
        id: data.id ?? null,
        title: data.title,
        dueBy: data.dueBy,
        priority: data.priority
      );
}