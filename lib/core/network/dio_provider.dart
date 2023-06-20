import 'package:dio/dio.dart';

import 'intercepter/logging_intercepter.dart';

class DioProvider {
  late Dio _dio;

  DioProvider() {
    _dio = Dio(BaseOptions(
      baseUrl: "http://numbersapi.com",
    ));
    _dio.interceptors.add(LoggingInterceptor());
  }

  Dio getProvider() {
    return _dio;
  }
}