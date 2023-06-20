import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/di.dart';
import 'package:test_app/infrastructure/datasources/number_trivia_remote_data_source.dart';

void main() {
  group('NumberTriviaApi', () {
    late NumberTriviaRemoteDataSource dataSource;

    setUp(() {
      init();
      dataSource = NumberTriviaRemoteDataSource();
    });

    test('should fetch trivia for a specific number', () async {
      const testNumber = 42;

      final trivia = await dataSource.getTriviaForNumber(testNumber);

      expect(trivia, isNotNull);
      expect(trivia.text, isNotEmpty);
    });

    test('should fetch random trivia', () async {
      final trivia = await dataSource.getRandomTrivia();

      expect(trivia, isNotNull);
      expect(trivia.text, isNotEmpty);
    });
  });
}
