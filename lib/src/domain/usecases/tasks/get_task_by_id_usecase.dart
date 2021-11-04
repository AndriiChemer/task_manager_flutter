import 'package:flutter_task_manager/src/core/resources/data_state.dart';
import 'package:flutter_task_manager/src/core/usecase/usecase.dart';
import 'package:flutter_task_manager/src/data/models/task/task_model.dart';
import 'package:flutter_task_manager/src/domain/repositories/task_repository.dart';

class GetTaskByIdUseCase implements UseCase<DataState<TaskModel>, int> {

  final TaskRepository _taskRepository;
  const GetTaskByIdUseCase(this._taskRepository);

  @override
  Future<DataState<TaskModel>> call({required int params}) =>
      _taskRepository.getTaskById(params);
}