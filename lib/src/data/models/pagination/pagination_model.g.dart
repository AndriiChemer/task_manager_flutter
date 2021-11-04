// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationModel _$PaginationModelFromJson(Map<String, dynamic> json) {
  return PaginationModel(
    current: json['current'] as int,
    limit: json['limit'] as int,
    count: json['count'] as int,
  );
}

Map<String, dynamic> _$PaginationModelToJson(PaginationModel instance) =>
    <String, dynamic>{
      'current': instance.current,
      'limit': instance.limit,
      'count': instance.count,
    };
