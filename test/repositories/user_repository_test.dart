// import 'dart:convert';
//
//
// import 'package:dio/dio.dart';
// import 'package:flutter_task_manager/data/remote/remote.dart';
// import 'package:flutter_task_manager/data/repository/repository.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
//
// import 'user_repository_test.mocks.dart';
//
// var mockToken = '''
// {
//   "token": "eyJ0*"
// }
// ''';
//
// @GenerateMocks([ApiProvider, UserRepository])
// void main() {
//   final mockApiProvider = MockApiProvider();
//   final mockUserRepository = MockUserRepository();
//
//   final userRequest = UserRequest("any", "password");
//   final mockException = Exception("Error");
//
//   tearDown((){});
//
//   group('Create user', () {
//     test("Create user success", () async {
//       final Response responseSuccess = Response(statusCode: 200, data: json.decode(mockToken), requestOptions: RequestOptions(path: ''));
//
//       when(mockApiProvider.createUser(userRequest))
//           .thenAnswer((_) => Future.value(responseSuccess));
//
//       String token = responseSuccess.data['token'];
//
//       when(mockUserRepository.createUser(userRequest))
//           .thenAnswer((realInvocation) => Future.value(token));
//
//       expect(await mockApiProvider.createUser(userRequest), responseSuccess);
//       expect(await mockUserRepository.createUser(userRequest), token);
//     });
//
//     test("Create user fail", () async {
//
//       when(mockUserRepository.createUser(userRequest))
//           .thenAnswer((realInvocation) => throw mockException);
//
//       expect(() async => await mockUserRepository.createUser(userRequest),
//           throwsA(isException));
//
//     });
//   });
//
//   group('Auth user', () {
//     test("Auth user success", () async {
//       final Response responseSuccess = Response(statusCode: 200, data: json.decode(mockToken), requestOptions: RequestOptions(path: ''));
//
//       when(mockApiProvider.authUser(userRequest))
//           .thenAnswer((_) => Future.value(responseSuccess));
//
//       String token = responseSuccess.data['token'];
//
//       when(mockUserRepository.auth(userRequest))
//           .thenAnswer((realInvocation) => Future.value(token));
//
//       expect(await mockApiProvider.authUser(userRequest), responseSuccess);
//       expect(await mockUserRepository.auth(userRequest), token);
//     });
//
//     test("Auth user fail", () async {
//
//       when(mockUserRepository.auth(userRequest))
//           .thenAnswer((realInvocation) => throw mockException);
//
//       expect(() async => await mockUserRepository.auth(userRequest),
//           throwsA(isException));
//
//     });
//   });
// }