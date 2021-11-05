import 'package:flutter_task_manager/src/core/params/request.dart';
import 'package:flutter_task_manager/src/core/resources/data_state.dart';
import 'package:flutter_task_manager/src/core/usecase/usecase.dart';
import 'package:flutter_task_manager/src/data/models/task/task_model.dart';
import 'package:flutter_task_manager/src/domain/repositories/task_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class CreateTaskUseCase implements UseCase<DataState<TaskModel>, TaskRequest> {
  final TaskRepository _taskRepository;
  
  const CreateTaskUseCase(this._taskRepository);
  
  @override
  Future<DataState<TaskModel>> call({required TaskRequest params}) =>
      _taskRepository.createTask(params);

}