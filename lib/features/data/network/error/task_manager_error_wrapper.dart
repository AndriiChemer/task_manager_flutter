import 'package:dio/dio.dart';
import 'package:flutter_task_manager/features/domain/network/task_manager_api_error.dart';

class TaskManagerDioErrorWrapper extends DioError {
  final TaskManagerApiError taskManagerApiError;

  TaskManagerDioErrorWrapper({
    required this.taskManagerApiError,
    required DioError original
  }) : super(
    requestOptions: original.requestOptions,
    response: original.response,
    error: original.error,
    type: original.type
  );
}