import 'package:get/instance_manager.dart';
import 'package:test_app/infrastructure/datasources/number_trivia_remote_data_source.dart';
import 'package:test_app/infrastructure/repositories/number_trivia_repository.dart';
import 'package:test_app/presentation/home/controller/home_page_controller.dart';

import 'core/network/dio_provider.dart';

void init() {
  Get.put(DioProvider());
  Get.put(NumberTriviaRepository(NumberTriviaRemoteDataSource()));
  Get.put(HomePageController(Get.find<NumberTriviaRepository>()));
}