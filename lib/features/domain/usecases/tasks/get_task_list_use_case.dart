import 'package:flutter_task_manager/core/model/models.dart';
import 'package:flutter_task_manager/core/resources/data_state.dart';
import 'package:flutter_task_manager/core/usecase/usecase.dart';
import 'package:flutter_task_manager/features/data/models/models.dart';
import 'package:flutter_task_manager/features/domain/repositories/repositories.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetTaskListUseCase implements UseCase<DataState<Pair<List<TaskModel>, PaginationModel>>, PaginationModel> {

  final TaskRepository _taskRepository;

  const GetTaskListUseCase(this._taskRepository);

  @override
  Future<DataState<Pair<List<TaskModel>, PaginationModel>>> call({required PaginationModel params}) =>
      _taskRepository.getTaskList();
}