// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskListResponse _$TaskListResponseFromJson(Map<String, dynamic> json) =>
    TaskListResponse(
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => TaskDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination:
          PaginationResponse.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TaskListResponseToJson(TaskListResponse instance) =>
    <String, dynamic>{
      'tasks': instance.tasks,
      'meta': instance.pagination,
    };
