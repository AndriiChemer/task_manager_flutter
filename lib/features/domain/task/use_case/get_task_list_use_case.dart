import 'package:flutter_task_manager/core/model/models.dart';
import 'package:flutter_task_manager/core/usecase/usecase.dart';
import 'package:flutter_task_manager/features/data/task/api/models/pagination/pagination_response.dart';
import 'package:flutter_task_manager/features/domain/task/model/pagination.dart';
import 'package:flutter_task_manager/features/domain/task/model/task.dart';
import 'package:injectable/injectable.dart';

import '../task_repository.dart';

@singleton
class GetTaskListUseCase implements UseCase<Pair<List<Task>, Pagination>, PaginationResponse> {

  final TaskRepository _taskRepository;

  const GetTaskListUseCase(this._taskRepository);

  @override
  Future<Pair<List<Task>, Pagination>> call({required PaginationResponse params}) =>
      _taskRepository.getTaskList();
}