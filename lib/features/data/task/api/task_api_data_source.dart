import 'package:dio/dio.dart';
import 'package:flutter_task_manager/core/params/task_request.dart';
import 'package:flutter_task_manager/features/data/network/task_manager_dio.dart';
import 'package:flutter_task_manager/features/data/task/api/models/task/task_response.dart';
import 'package:flutter_task_manager/features/data/task/api/models/task_list_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'task_api_data_source.g.dart';

@Singleton()
@RestApi()
abstract class TaskApiDataSource {

  @factoryMethod
  factory TaskApiDataSource(TaskManagerDio dio) = _TaskApiDataSource;

  @POST('/api/tasks')
  Future<TaskResponseDTO> createTask(@Body() TaskRequest taskRequest);

  @DELETE('/api/tasks/{id}')
  Future<void> deleteTask(@Path() int id);

  @GET('/api/tasks/{id}')
  Future<TaskDTO> getTaskById(@Path() int id);

  /// "/tasks?sort=${sortType.toLowerCase()}%20${orderBy.toLowerCase()}"
  @GET('/api/tasks')
  Future<TaskListResponse> getTaskList(@Query("sort") String sort, @Query("order") String order);

  @PUT('/api/tasks/{id}')
  Future<void> updateTask(@Path()int id, @Body() TaskRequest taskRequest);
}