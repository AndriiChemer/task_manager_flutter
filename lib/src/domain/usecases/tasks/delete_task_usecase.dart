import 'package:flutter_task_manager/src/core/resources/data_state.dart';
import 'package:flutter_task_manager/src/core/usecase/usecase.dart';
import 'package:flutter_task_manager/src/domain/repositories/task_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class DeleteTaskUseCase implements UseCase<DataState<bool>, int> {
  final TaskRepository _taskRepository;
  const DeleteTaskUseCase(this._taskRepository);

  @override
  Future<DataState<bool>> call({required int params}) =>
      _taskRepository.deleteTaskById(params);

}