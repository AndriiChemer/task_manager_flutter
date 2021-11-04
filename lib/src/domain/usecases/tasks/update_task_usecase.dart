import 'package:flutter_task_manager/src/core/params/request.dart';
import 'package:flutter_task_manager/src/core/resources/data_state.dart';
import 'package:flutter_task_manager/src/core/usecase/usecase.dart';
import 'package:flutter_task_manager/src/domain/repositories/task_repository.dart';

class UpdateTaskUseCase implements UseCase<DataState<bool>, TaskRequest> {
  final TaskRepository _taskRepository;
  const UpdateTaskUseCase(this._taskRepository);

  @override
  Future<DataState<bool>> call({required TaskRequest params}) =>
      _taskRepository.updateTask(params);

}