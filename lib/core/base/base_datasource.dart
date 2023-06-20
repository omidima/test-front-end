import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:test_app/core/network/dio_provider.dart';

class BaseDatasource {
  late Dio dio;

  BaseDatasource() {
    dio = Get.find<DioProvider>().getProvider();
  }
}