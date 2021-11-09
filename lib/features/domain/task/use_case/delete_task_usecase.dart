import 'package:flutter_task_manager/core/usecase/usecase.dart';
import 'package:flutter_task_manager/features/domain/task/task_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class DeleteTaskUseCase implements UseCase<void, int> {
  final TaskRepository _taskRepository;
  const DeleteTaskUseCase(this._taskRepository);

  @override
  Future<void> call({required int params}) =>
      _taskRepository.deleteTaskById(params);
}