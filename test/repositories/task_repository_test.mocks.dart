// Mocks generated by Mockito 5.0.13 from annotations
// in flutter_task_manager/test/repositories/task_repository_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dio/dio.dart' as _i2;
import 'package:flutter_task_manager/data/remote/remote.dart' as _i3;
import 'package:flutter_task_manager/data/repository/repository.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeOptions extends _i1.Fake implements _i2.Options {}

class _FakeResponse<T> extends _i1.Fake implements _i2.Response<T> {}

class _FakeApi extends _i1.Fake implements _i3.Api {}

class _FakeTaskListResponse extends _i1.Fake implements _i3.TaskListResponse {}

class _FakeTaskResponse extends _i1.Fake implements _i3.TaskResponse {}

/// A class which mocks [ApiProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiProvider extends _i1.Mock implements _i3.ApiProvider {
  MockApiProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Options get options => (super.noSuchMethod(Invocation.getter(#options),
      returnValue: _FakeOptions()) as _i2.Options);
  @override
  set options(_i2.Options? _options) =>
      super.noSuchMethod(Invocation.setter(#options, _options),
          returnValueForMissingStub: null);
  @override
  _i4.Future<_i2.Response<dynamic>> createUser(_i3.UserRequest? userRequest) =>
      (super.noSuchMethod(Invocation.method(#createUser, [userRequest]),
              returnValue:
                  Future<_i2.Response<dynamic>>.value(_FakeResponse<dynamic>()))
          as _i4.Future<_i2.Response<dynamic>>);
  @override
  _i4.Future<_i2.Response<dynamic>> authUser(_i3.UserRequest? userRequest) =>
      (super.noSuchMethod(Invocation.method(#authUser, [userRequest]),
              returnValue:
                  Future<_i2.Response<dynamic>>.value(_FakeResponse<dynamic>()))
          as _i4.Future<_i2.Response<dynamic>>);
  @override
  _i4.Future<_i2.Response<dynamic>> getTaskList(
          String? token, String? sortType, String? orderBy) =>
      (super.noSuchMethod(
              Invocation.method(#getTaskList, [token, sortType, orderBy]),
              returnValue:
                  Future<_i2.Response<dynamic>>.value(_FakeResponse<dynamic>()))
          as _i4.Future<_i2.Response<dynamic>>);
  @override
  _i4.Future<_i2.Response<dynamic>> createTask(
          String? token, _i3.TaskRequest? taskRequest) =>
      (super.noSuchMethod(Invocation.method(#createTask, [token, taskRequest]),
              returnValue:
                  Future<_i2.Response<dynamic>>.value(_FakeResponse<dynamic>()))
          as _i4.Future<_i2.Response<dynamic>>);
  @override
  _i4.Future<_i2.Response<dynamic>> getTaskById(int? taskId, String? token) =>
      (super.noSuchMethod(Invocation.method(#getTaskById, [taskId, token]),
              returnValue:
                  Future<_i2.Response<dynamic>>.value(_FakeResponse<dynamic>()))
          as _i4.Future<_i2.Response<dynamic>>);
  @override
  _i4.Future<_i2.Response<dynamic>> deleteTask(int? taskId, String? token) =>
      (super.noSuchMethod(Invocation.method(#deleteTask, [taskId, token]),
              returnValue:
                  Future<_i2.Response<dynamic>>.value(_FakeResponse<dynamic>()))
          as _i4.Future<_i2.Response<dynamic>>);
  @override
  _i4.Future<_i2.Response<dynamic>> updateTask(
          int? taskId, String? token, _i3.TaskRequest? taskRequest) =>
      (super.noSuchMethod(
              Invocation.method(#updateTask, [taskId, token, taskRequest]),
              returnValue:
                  Future<_i2.Response<dynamic>>.value(_FakeResponse<dynamic>()))
          as _i4.Future<_i2.Response<dynamic>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [TaskRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTaskRepository extends _i1.Mock implements _i5.TaskRepository {
  MockTaskRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Api get api =>
      (super.noSuchMethod(Invocation.getter(#api), returnValue: _FakeApi())
          as _i3.Api);
  @override
  _i4.Future<_i3.TaskListResponse> getTaskList() =>
      (super.noSuchMethod(Invocation.method(#getTaskList, []),
              returnValue:
                  Future<_i3.TaskListResponse>.value(_FakeTaskListResponse()))
          as _i4.Future<_i3.TaskListResponse>);
  @override
  _i4.Future<_i3.TaskResponse> getTaskById(int? taskId) =>
      (super.noSuchMethod(Invocation.method(#getTaskById, [taskId]),
              returnValue: Future<_i3.TaskResponse>.value(_FakeTaskResponse()))
          as _i4.Future<_i3.TaskResponse>);
  @override
  _i4.Future<int> deleteTaskById(int? id) =>
      (super.noSuchMethod(Invocation.method(#deleteTaskById, [id]),
          returnValue: Future<int>.value(0)) as _i4.Future<int>);
  @override
  _i4.Future<_i3.TaskResponse> createTask(
          String? title, String? description, String? priority, int? dueBy) =>
      (super.noSuchMethod(
          Invocation.method(#createTask, [title, description, priority, dueBy]),
          returnValue:
              Future<_i3.TaskResponse>.value(_FakeTaskResponse())) as _i4
          .Future<_i3.TaskResponse>);
  @override
  _i4.Future<void> updateTask(int? taskId, String? title, String? description,
          String? priority, int? dueBy) =>
      (super.noSuchMethod(
          Invocation.method(
              #updateTask, [taskId, title, description, priority, dueBy]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  String toString() => super.toString();
  @override
  _i4.Future<String> getErrorMessage(dynamic error) =>
      (super.noSuchMethod(Invocation.method(#getErrorMessage, [error]),
          returnValue: Future<String>.value('')) as _i4.Future<String>);
}
