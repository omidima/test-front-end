import 'package:get/get.dart';
import '../../../core/dto/number_trivia_dto.dart';
import '../../../infrastructure/repositories/number_trivia_repository.dart';

class HomePageController extends GetxController {
  final NumberTriviaRepository repository;

  HomePageController(this.repository);

  final trivia = NumberTriviaDto('').obs;

  Future<void> fetchTriviaForNumber(int number) async {
    final result = await repository.getTriviaForNumber(number);
    result.fold(
      (error) => print('Error: $error'),
      (data) => trivia.value = data,
    );
  }

  Future<void> fetchRandomTrivia() async {
    final result = await repository.getRandomTrivia();
    result.fold(
      (error) => print('Error: $error'),
      (data) => trivia.value = data,
    );
  }
}
