import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
@freezed
class Task with _$Task {
  factory Task({
    @Default(null) int? id,
    @Default('') String title,
    @Default(0) int dueBy,
    @Default('') String priority,
  }) = _Task;

  const Task._();
}