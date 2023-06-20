import 'package:dartz/dartz.dart';
import '../dto/number_trivia_dto.dart';

abstract class INumberTriviaRepository {
  Future<Either<String, NumberTriviaDto>> getTriviaForNumber(int number);
  Future<Either<String, NumberTriviaDto>> getRandomTrivia();
}
