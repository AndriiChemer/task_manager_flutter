
// import 'dart:convert';
//
// import 'package:dio/dio.dart';
// import 'package:flutter_task_manager/data/remote/remote.dart';
// import 'package:flutter_task_manager/data/repository/repository.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
//
// import 'task_repository_test.mocks.dart';

//flutter pub run build_runner build
// @GenerateMocks([ApiProvider, TaskRepository])
// void main() {
//
//   final mockApiProvider = MockApiProvider();
//   final mockTaskRepository = MockTaskRepository();
//   final mockException = Exception("Error");
//
//   group('Loading Tasks', () {
//     test("Load task list success", () async {
//       final Response responseSuccess = Response(
//           statusCode: 200,
//           data: json.decode(mockTaskListJson),
//           requestOptions: RequestOptions(path: ''));
//
//       when(mockApiProvider.getTaskList("any", "any", "any"))
//           .thenAnswer((realInvocation) => Future.value(responseSuccess));
//
//       TaskListResponse taskListResponse = TaskListResponse.fromJson(responseSuccess.data);
//
//       when(mockTaskRepository.getTaskList())
//           .thenAnswer((realInvocation) => Future.value(taskListResponse));
//
//
//       expect(await mockApiProvider.getTaskList("any", "any", "any"), responseSuccess);
//       expect(await mockTaskRepository.getTaskList(), taskListResponse);
//     });
//
//     test("Load apps error occurred", () async {
//
//       when(mockTaskRepository.getTaskList())
//           .thenAnswer((realInvocation) => throw mockException);
//
//       expect(() async => await mockTaskRepository.getTaskList(),
//           throwsA(isException));
//
//     });
//   });
//
//   group('Loading Task by id', () {
//     final taskId = 0;
//
//     test("Load task success", () async {
//       final Response responseSuccess = Response(
//           statusCode: 200,
//           data: json.decode(mockTaskJson),
//           requestOptions: RequestOptions(path: ''));
//
//       when(mockApiProvider.getTaskById(taskId, "any"))
//           .thenAnswer((realInvocation) => Future.value(responseSuccess));
//
//       TaskResponse taskResponse = TaskResponse.fromJson(responseSuccess.data['task']);
//
//       when(mockTaskRepository.getTaskById(taskId))
//           .thenAnswer((realInvocation) => Future.value(taskResponse));
//
//
//       expect(await mockApiProvider.getTaskById(taskId, "any"), responseSuccess);
//       expect(await mockTaskRepository.getTaskById(taskId), taskResponse);
//     });
//
//     test("Load apps error occurred", () async {
//
//       when(mockTaskRepository.getTaskById(taskId))
//           .thenAnswer((realInvocation) => throw mockException);
//
//       expect(() async => await mockTaskRepository.getTaskList(),
//           throwsA(isException));
//
//     });
//   });
//
//   group('Adding Task', () {
//
//     test("Add task success", () async {
//
//       var taskRequest = TaskRequest(title: 'any', priority: 'any', dueBy: 0);
//
//       final Response responseSuccess = Response(
//           statusCode: 200,
//           data: json.decode(mockTaskJson),
//           requestOptions: RequestOptions(path: ''));
//
//       when(mockApiProvider.createTask('any', taskRequest))
//           .thenAnswer((realInvocation) => Future.value(responseSuccess));
//
//       TaskResponse taskResponse = TaskResponse.fromJson(responseSuccess.data['task']);
//
//       when(mockTaskRepository.createTask('any', 'any', 'any', 0))
//           .thenAnswer((realInvocation) => Future.value(taskResponse));
//
//
//       expect(await mockApiProvider.createTask('any', taskRequest), responseSuccess);
//       expect(await mockTaskRepository.createTask('any', 'any', 'any', 0), taskResponse);
//     });
//
//     test("Adding task error occurred", () async {
//
//       when(mockTaskRepository.createTask('any', 'any', 'any', 0))
//           .thenAnswer((realInvocation) => throw mockException);
//
//       expect(() async => await mockTaskRepository.createTask('any', 'any', 'any', 0),
//           throwsA(isException));
//     });
//   });
//
//   group('Updating Task', () {
//
//     test("Update task success", () async {
//
//       var taskRequest = TaskRequest(title: 'any', priority: 'any', dueBy: 0);
//       final Response responseSuccess = Response(
//           statusCode: 200,
//           data: json.decode(mockTaskJson),
//           requestOptions: RequestOptions(path: ''));
//
//       when(mockApiProvider.updateTask(0, 'any', taskRequest))
//           .thenAnswer((realInvocation) => Future.value(responseSuccess));
//
//       expect(await mockApiProvider.updateTask(0, 'any', taskRequest), responseSuccess);
//     });
//
//     test("Updating task error occurred", () async {
//
//       when(mockTaskRepository.updateTask(0, 'any', 'any', 'any', 0))
//           .thenAnswer((realInvocation) => throw mockException);
//
//       expect(() async => await mockTaskRepository.updateTask(0, 'any', 'any', 'any', 0),
//           throwsA(isException));
//     });
//   });
//
//   group('Deleting Task', () {
//
//     test("Deleting task success", () async {
//
//       var taskId = 0;
//
//       when(mockTaskRepository.deleteTaskById(taskId))
//           .thenAnswer((realInvocation) => Future.value(taskId));
//
//       expect(await mockTaskRepository.deleteTaskById(taskId), taskId);
//     });
//
//     test("Deleting task fail", () async {
//
//       var taskId = 0;
//       when(mockTaskRepository.deleteTaskById(taskId))
//           .thenAnswer((realInvocation) => throw mockException);
//
//       expect(() async => await mockTaskRepository.deleteTaskById(taskId),
//           throwsA(isException));
//     });
//   });
// }
//
// var mockTaskListJson = '''
// {
//   "tasks": [
//     {
//       "id": 43,
//       "title": "Meeting",
//       "dueBy": 1549477494,
//       "priority": "High"
//     }
//   ],
//   "meta": {
//     "current": 1,
//     "limit": 15,
//     "count": 14
//   }
// }
// ''';
//
// var mockTaskJson = '''
// {
//   "task": {
//     "id": 0,
//     "title": "any",
//     "dueBy": 0,
//     "priority": "any"
//   }
// }
// ''';