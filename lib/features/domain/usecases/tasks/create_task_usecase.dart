import 'package:flutter_task_manager/core/params/request.dart';
import 'package:flutter_task_manager/core/resources/data_state.dart';
import 'package:flutter_task_manager/core/usecase/usecase.dart';
import 'package:flutter_task_manager/features/data/models/models.dart';
import 'package:flutter_task_manager/features/domain/repositories/repositories.dart';
import 'package:injectable/injectable.dart';

@singleton
class CreateTaskUseCase implements UseCase<DataState<TaskModel>, TaskRequest> {
  final TaskRepository _taskRepository;
  
  const CreateTaskUseCase(this._taskRepository);
  
  @override
  Future<DataState<TaskModel>> call({required TaskRequest params}) =>
      _taskRepository.createTask(params);

}