import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';

@freezed
class Task with _$Task {
  const Task._();

  factory Task({
    required int id,
    required String title,
    required int dueBy,
    required String priority,
  }) = _Task;

}