import 'package:flutter_task_manager/core/usecase/usecase.dart';
import 'package:flutter_task_manager/features/domain/task/model/task.dart';
import 'package:flutter_task_manager/features/domain/task/task_repository.dart';
import 'package:injectable/injectable.dart';


@singleton
class GetTaskByIdUseCase implements UseCase<Task, int> {

  final TaskRepository _taskRepository;
  const GetTaskByIdUseCase(this._taskRepository);

  @override
  Future<Task> call({required int params}) =>
      _taskRepository.getTaskById(params);
}