// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskResponseDTO _$TaskResponseDTOFromJson(Map<String, dynamic> json) =>
    TaskResponseDTO(
      TaskDTO.fromJson(json['task'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TaskResponseDTOToJson(TaskResponseDTO instance) =>
    <String, dynamic>{
      'task': instance.task,
    };

TaskDTO _$TaskDTOFromJson(Map<String, dynamic> json) => TaskDTO(
      id: json['id'] as int?,
      title: json['title'] as String,
      dueBy: json['dueBy'] as int,
      priority: json['priority'] as String,
    );

Map<String, dynamic> _$TaskDTOToJson(TaskDTO instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'dueBy': instance.dueBy,
      'priority': instance.priority,
    };
