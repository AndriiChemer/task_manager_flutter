import 'package:flutter_task_manager/core/params/request.dart';
import 'package:flutter_task_manager/core/usecase/usecase.dart';
import 'package:flutter_task_manager/features/domain/task/model/task.dart';
import 'package:injectable/injectable.dart';

import '../task_repository.dart';

@singleton
class CreateTaskUseCase implements UseCase<int, Task> {
  final TaskRepository _taskRepository;
  
  const CreateTaskUseCase(this._taskRepository);
  
  @override
  Future<int> call({required Task params}) =>
      _taskRepository.createTask(params);
}