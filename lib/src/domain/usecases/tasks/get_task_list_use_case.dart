import 'package:flutter_task_manager/src/core/model/pair.dart';
import 'package:flutter_task_manager/src/core/resources/data_state.dart';
import 'package:flutter_task_manager/src/core/usecase/usecase.dart';
import 'package:flutter_task_manager/src/data/models/pagination/pagination_model.dart';
import 'package:flutter_task_manager/src/data/models/task/task_model.dart';
import 'package:flutter_task_manager/src/domain/repositories/task_repository.dart';

class GetTaskListUseCase implements UseCase<DataState<Pair<List<TaskModel>, PaginationModel>>, PaginationModel> {

  final TaskRepository _taskRepository;

  const GetTaskListUseCase(this._taskRepository);

  @override
  Future<DataState<Pair<List<TaskModel>, PaginationModel>>> call({required PaginationModel params}) =>
      _taskRepository.getTaskList();
}