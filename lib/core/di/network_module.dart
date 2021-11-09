import 'package:dio/dio.dart';
import 'package:flutter_task_manager/features/data/network/interceptors/auth_token_interceptor.dart';
import 'package:flutter_task_manager/features/data/network/interceptors/content_type_interceptor.dart';
import 'package:flutter_task_manager/features/data/network/interceptors/error_interceptor.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {

  @Injectable()
  List<Interceptor> mainInterceptors(
      AuthTokenInterceptor authTokenInterceptor,
      ContentTypeInterceptor contentTypeInterceptor,
      ErrorInterceptor errorInterceptor,
      ) =>
      [
        authTokenInterceptor,
        contentTypeInterceptor,
        errorInterceptor,
      ];
}