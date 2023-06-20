import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:test_app/main.dart';


class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print(options.baseUrl);
    logger.i("Network", [
      "REQUEST: ${options.method}",
      "PATH: ${options.baseUrl}${options.path}",
      "HEADER ${options.headers}",
      "DATA: ${options.data}",
    ]);
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.i("Network", [
      "RESPONSE: ${response.statusCode}",
      "PATH: ${response.requestOptions.path}",
      "STATUS:${response.statusMessage}",
      "HEADER ${response.headers}",
      "DATA: ${response.toString()}",
    ]);
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logger.e("Network", [
      "ERROR: ${err.error}",
      "PATH: ${err.requestOptions.path}",
      "STATUS:${err.response?.statusCode}",
      "RESPONSE ${err.response?.data}",
    ]);
    return super.onError(err, handler);
  }
}
