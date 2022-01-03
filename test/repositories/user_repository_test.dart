import 'package:flutter_task_manager/core/params/user_request.dart';
import 'package:flutter_task_manager/features/data/auth/api/auth_api_data_source.dart';
import 'package:flutter_task_manager/features/data/auth/auth_repository_impl.dart';
import 'package:flutter_task_manager/features/data/auth/auth_storage_impl.dart';
import 'package:flutter_task_manager/features/domain/auth/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_repository_test.mocks.dart';

var mockToken = '''
{
  "token": "eyJ0*"
}
''';

@GenerateMocks([AuthApiDataSource, AuthStorageImpl])
void main() {
  late AuthApiDataSource mockAuthApiDataSource;
  late AuthStorageImpl mockAuthStorageImpl;
  late AuthRepository authRepository;

  final userRequest = UserRequest(email: "email", password: "password");
  final mockException = Exception("Error");

  setUp(() {
    mockAuthApiDataSource = MockAuthApiDataSource();
    mockAuthStorageImpl = MockAuthStorageImpl();

    authRepository = UserRepositoryImpl(mockAuthApiDataSource, mockAuthStorageImpl);
  });

  group('Create user', () {
    test("Create user success", () async {
      // final Response responseSuccess = Response(statusCode: 200, data: json.decode(mockToken), requestOptions: RequestOptions(path: ''));
      //
      // when(mockApiProvider.createUser(userRequest))
      //     .thenAnswer((_) => Future.value(responseSuccess));
      //
      // String token = responseSuccess.data['token'];
      //
      // when(mockUserRepository.createUser(userRequest))
      //     .thenAnswer((realInvocation) => Future.value(token));
      //
      // expect(await mockApiProvider.createUser(userRequest), responseSuccess);
      // expect(await mockUserRepository.createUser(userRequest), token);
    });

    test("Create user fail", () async {

      // when(mockUserRepository.createUser(userRequest))
      //     .thenAnswer((realInvocation) => throw mockException);
      //
      // expect(() async => await mockUserRepository.createUser(userRequest),
      //     throwsA(isException));

    });
  });

  group('Auth user', () {
    test("Auth user success", () async {
      // final Response responseSuccess = Response(statusCode: 200, data: json.decode(mockToken), requestOptions: RequestOptions(path: ''));
      //
      // when(mockApiProvider.authUser(userRequest))
      //     .thenAnswer((_) => Future.value(responseSuccess));
      //
      // String token = responseSuccess.data['token'];
      //
      // when(mockUserRepository.auth(userRequest))
      //     .thenAnswer((realInvocation) => Future.value(token));
      //
      // expect(await mockApiProvider.authUser(userRequest), responseSuccess);
      // expect(await mockUserRepository.auth(userRequest), token);
    });

    test("Auth user fail", () async {
      //
      // when(mockUserRepository.auth(userRequest))
      //     .thenAnswer((realInvocation) => throw mockException);
      //
      // expect(() async => await mockUserRepository.auth(userRequest),
      //     throwsA(isException));

    });
  });
}