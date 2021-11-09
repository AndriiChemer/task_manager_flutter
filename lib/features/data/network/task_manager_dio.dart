import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'interceptors/abstract_interceptor_with_dio.dart';

@Singleton()
class TaskManagerDio extends DioMixin implements Dio {
  static const acceptHeaderValue = 'application/json';
  static const contentTypeHeaderValue = 'application/json';
  static const _timeouts = Duration(seconds: 15);

  TaskManagerDio(List<Interceptor> interceptorList) {
    options = BaseOptions(
      baseUrl: 'https://testapi.doitserver.in.ua',
      headers: {
        HttpHeaders.acceptHeader: acceptHeaderValue,
        HttpHeaders.contentTypeHeader: contentTypeHeaderValue,
      },
      followRedirects: false,
      sendTimeout: _timeouts.inMilliseconds,
      connectTimeout: _timeouts.inMilliseconds,
      receiveTimeout: _timeouts.inMilliseconds,
    );

    httpClientAdapter = DefaultHttpClientAdapter();
    _setupInterceptors(interceptorList);
  }

  @factoryMethod
  factory TaskManagerDio.create(
    List<Interceptor> interceptors
  ) => TaskManagerDio(interceptors);

  void _setupInterceptors(List<Interceptor> interceptorList) {
    interceptorList.whereType<InterceptorWithDio>().forEach((element) => element.set(this));
    interceptors.addAll(interceptorList);
  }
}