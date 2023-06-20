import 'package:dartz/dartz.dart';
import '../../core/dto/number_trivia_dto.dart';
import '../../core/interfaces/number_trivia_repository.dart';
import '../datasources/number_trivia_remote_data_source.dart';

class NumberTriviaRepository implements INumberTriviaRepository {
  final NumberTriviaRemoteDataSource remoteDataSource;

  NumberTriviaRepository(this.remoteDataSource);

  @override
  Future<Either<String, NumberTriviaDto>> getTriviaForNumber(int number) async {
    try {
      final trivia = await remoteDataSource.getTriviaForNumber(number);
      return Right(trivia);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, NumberTriviaDto>> getRandomTrivia() async {
    try {
      final trivia = await remoteDataSource.getRandomTrivia();
      return Right(trivia);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
