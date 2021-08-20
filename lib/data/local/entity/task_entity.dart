import 'package:floor/floor.dart';

@entity
class TaskEntity {
  @primaryKey
  final int id;
  final String title;
  final int dueBy;
  final String priority;
  final String description;
  final bool isSynchronized;

  TaskEntity(
      this.id,
      this.title,
      this.dueBy,
      this.priority,
      this.description,
      this.isSynchronized);

}