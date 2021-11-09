import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_task_manager/core/notifiers/auth_notifier.dart';
import 'package:flutter_task_manager/features/data/network/error/general_dio_error_wrapper.dart';
import 'package:flutter_task_manager/features/data/network/error/task_manager_error_wrapper.dart';
import 'package:flutter_task_manager/features/domain/network/general_connection_error.dart';
import 'package:flutter_task_manager/features/domain/network/task_manager_api_error.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ErrorInterceptor extends Interceptor {
  static const int AUTHORIZATION_CODE = 401;

  final AuthNotifier _authNotifier;

  ErrorInterceptor(this._authNotifier);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final response = err.response;

    if(err.type == DioErrorType.response && response != null) {
      try {
        _checkUserAuthorization(response);

        final rawData = response.data as Map<String, dynamic>;
        print('ANDRII rawData: $rawData');
        // final jsonData = jsonDecode(rawData) as Map<String, dynamic>;
        final taskManagerApiError = TaskManagerApiError.fromJson(rawData);

        return handler.next(TaskManagerDioErrorWrapper(
            taskManagerApiError: taskManagerApiError,
            original: err
          )
        );
      } catch (e, s) {
        print('Passing response error from API failed.\nException: $e\nStackTrace: $s');
      }
    }

    if(err.type is SocketException) {
      return handler.next(GeneralDioErrorWrapper(
          connectionError: GeneralConnectionError.noConnection(),
          original: err
        )
      );
    }

    if(_isTimeoutException(err.type)) {
      return handler.next(GeneralDioErrorWrapper(
        connectionError: GeneralConnectionError.timeout(),
        original: err
      ));
    }

    super.onError(err, handler);
  }

  bool _isTimeoutException(DioErrorType type) =>
      type == DioErrorType.receiveTimeout ||
      type == DioErrorType.connectTimeout ||
      type == DioErrorType.sendTimeout;

  void _checkUserAuthorization(Response<dynamic> response) {
    final isUserUnauthorized = response.statusCode == AUTHORIZATION_CODE;
    if(isUserUnauthorized) {
      _authNotifier.setUserAuthorization(false);
    }
  }
}