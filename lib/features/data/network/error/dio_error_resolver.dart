import 'package:flutter_task_manager/features/data/common/data_mapper.dart';
import 'package:flutter_task_manager/features/data/network/error/general_dio_error_wrapper.dart';
import 'package:flutter_task_manager/features/data/network/error/task_manager_error_wrapper.dart';
import 'package:flutter_task_manager/features/domain/network/task_manager_api_error.dart';

Future<R> callWithDioErrorResolver<R, E extends Object>(
    Future<R> Function() request, {
    DataMapper<TaskManagerApiError, E>? taskManagerApiErrorMapper,
}) async {
   try {
      return await request();
   } on TaskManagerDioErrorWrapper catch (e) {
      throw taskManagerApiErrorMapper?.call(e.taskManagerApiError) ?? e.taskManagerApiError;
   } on GeneralDioErrorWrapper catch (e) {
      throw e.connectionError;
   }
}