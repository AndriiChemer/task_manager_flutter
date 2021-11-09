import 'package:flutter_task_manager/features/data/task/api/models/pagination/pagination_response.dart';
import 'package:flutter_task_manager/features/data/task/api/models/task/task_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_list_response.g.dart';

@JsonSerializable(createToJson: true)
class TaskListResponse {
  final List<TaskResponse> tasks;
  @JsonKey(name: 'meta')
  final PaginationResponse pagination;

  TaskListResponse({
    required this.tasks,
    required this.pagination
  });

  factory TaskListResponse.fromJson(Map<String, dynamic> map)
  => _$TaskListResponseFromJson(map);

  Map<String, dynamic> toJson() => _$TaskListResponseToJson(this);
}