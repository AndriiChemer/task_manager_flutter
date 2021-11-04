import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
@JsonSerializable(createToJson: true)
class TaskModel with _$TaskModel  {
  const TaskModel._();

  factory TaskModel({
    int? id,
    required String title,
    required int dueBy,
    required String priority,
  }) = _TaskModel;

  factory TaskModel.fromMapJson(Map<String, dynamic> map)
      => _$TaskModelFromJson(map);
}