import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:test_app/core/dto/number_trivia_dto.dart';
import 'package:test_app/infrastructure/datasources/number_trivia_remote_data_source.dart';
import 'package:test_app/infrastructure/repositories/number_trivia_repository.dart';

class MockNumberTriviaRemoteDataSource extends Mock
    implements NumberTriviaRemoteDataSource {

    }

void main() {
  group('NumberTriviaRepositoryImpl', () {
    late NumberTriviaRepository repository;
    late MockNumberTriviaRemoteDataSource mockRemoteDataSource;

    setUp(() {
      mockRemoteDataSource = MockNumberTriviaRemoteDataSource();
      repository = NumberTriviaRepository(mockRemoteDataSource);
    });

    test('should return trivia for a specific number', () async {
      const testNumber = 42;
      final testTrivia = NumberTriviaDto('Test trivia');
      when(mockRemoteDataSource.getTriviaForNumber(testNumber))
          .thenAnswer((_) async {return testTrivia;});

      final result = await repository.getTriviaForNumber(testNumber);

      expect(result,testTrivia);
      verify(mockRemoteDataSource.getTriviaForNumber(testNumber));
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test('should return random trivia', () async {
      final testTrivia = NumberTriviaDto('Test trivia');
      when(mockRemoteDataSource.getRandomTrivia())
          .thenAnswer((_) async => testTrivia);

      final result = await repository.getRandomTrivia();

      expect(result, equals(Right(testTrivia)));
      verify(mockRemoteDataSource.getRandomTrivia());
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });
}
