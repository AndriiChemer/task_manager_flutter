// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskResponse _$TaskResponseFromJson(Map<String, dynamic> json) => TaskResponse(
      id: json['id'] as int?,
      title: json['title'] as String,
      dueBy: json['dueBy'] as int,
      priority: json['priority'] as String,
    );

Map<String, dynamic> _$TaskResponseToJson(TaskResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'dueBy': instance.dueBy,
      'priority': instance.priority,
    };
