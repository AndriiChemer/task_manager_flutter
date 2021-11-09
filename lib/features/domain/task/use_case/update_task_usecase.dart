import 'package:flutter_task_manager/core/usecase/usecase.dart';
import 'package:flutter_task_manager/features/domain/task/model/task.dart';
import 'package:injectable/injectable.dart';

import '../task_repository.dart';

@singleton
class UpdateTaskUseCase implements UseCase<void, Task> {
  final TaskRepository _taskRepository;
  const UpdateTaskUseCase(this._taskRepository);

  @override
  Future<void> call({required Task params}) =>
      _taskRepository.updateTask(params);
}