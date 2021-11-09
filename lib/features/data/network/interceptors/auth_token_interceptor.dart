import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_task_manager/features/domain/auth/use_case/get_token_usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class AuthTokenInterceptor extends Interceptor {
  final GetTokenUseCase _getTokenUseCase;
  AuthTokenInterceptor(this._getTokenUseCase);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {

    try {
      final token = await _getTokenUseCase();
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    } catch(e, s) {
      print('Failed adding authorization header to Api call.\nException: $e\nStackTrace: $s');
    }
    super.onRequest(options, handler);
  }
}