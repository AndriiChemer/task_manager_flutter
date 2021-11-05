import 'package:flutter_task_manager/core/params/request.dart';
import 'package:flutter_task_manager/core/resources/data_state.dart';
import 'package:flutter_task_manager/core/usecase/usecase.dart';
import 'package:flutter_task_manager/features/domain/repositories/repositories.dart';
import 'package:injectable/injectable.dart';

@singleton
class UpdateTaskUseCase implements UseCase<DataState<bool>, TaskRequest> {
  final TaskRepository _taskRepository;
  const UpdateTaskUseCase(this._taskRepository);

  @override
  Future<DataState<bool>> call({required TaskRequest params}) =>
      _taskRepository.updateTask(params);

}