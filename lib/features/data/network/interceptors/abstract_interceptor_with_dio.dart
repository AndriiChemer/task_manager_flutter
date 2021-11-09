import 'package:dio/dio.dart';

abstract class InterceptorWithDio extends Interceptor {
  late Dio dio;

  void set(Dio dio) => this.dio = dio;
}