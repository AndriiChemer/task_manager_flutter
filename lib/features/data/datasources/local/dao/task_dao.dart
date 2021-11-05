import 'package:floor/floor.dart';

import '../entity/entity.dart';

@dao
abstract class TaskDao {
  @Query('SELECT * FROM Task')
  Future<List<TaskEntity>> getAllTasks();

  @insert
  Future<void> insertTaskEntity(TaskEntity person);

  @update
  Future<void> updateTaskEntity(TaskEntity person);
}