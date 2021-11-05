import 'package:flutter_task_manager/core/resources/data_state.dart';
import 'package:flutter_task_manager/core/usecase/usecase.dart';
import 'package:flutter_task_manager/features/data/models/models.dart';
import 'package:flutter_task_manager/features/domain/repositories/repositories.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetTaskByIdUseCase implements UseCase<DataState<TaskModel>, int> {

  final TaskRepository _taskRepository;
  const GetTaskByIdUseCase(this._taskRepository);

  @override
  Future<DataState<TaskModel>> call({required int params}) =>
      _taskRepository.getTaskById(params);
}