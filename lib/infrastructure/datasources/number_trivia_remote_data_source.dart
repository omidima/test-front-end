import '../../core/base/base_datasource.dart';
import '../../core/dto/number_trivia_dto.dart';

class NumberTriviaRemoteDataSource extends BaseDatasource{

  Future<NumberTriviaDto> getTriviaForNumber(int number) async {
    final response = await dio.get('/$number');
    return NumberTriviaDto(response.data);
  }

  Future<NumberTriviaDto> getRandomTrivia() async {
    final response = await dio.get('/random');
    return NumberTriviaDto(response.data);
  }
}
