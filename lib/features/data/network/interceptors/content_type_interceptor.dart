import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_task_manager/features/data/network/task_manager_dio.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ContentTypeInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final contentType = response.headers.map[Headers.contentTypeHeader];
    if(contentType?.join('') == TaskManagerDio.contentTypeHeaderValue) {
      final rawResponse = response.data;

      if(rawResponse is String) {
        response.data = jsonDecode(rawResponse);
      }
    }
    super.onResponse(response, handler);
  }
}