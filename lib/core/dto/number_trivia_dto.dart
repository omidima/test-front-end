import 'package:json_annotation/json_annotation.dart';

part 'number_trivia_dto.g.dart';

@JsonSerializable()
class NumberTriviaDto {
  final String text;

  NumberTriviaDto(this.text);

  factory NumberTriviaDto.fromJson(Map<String, dynamic> json) =>
      _$NumberTriviaDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NumberTriviaDtoToJson(this);
}
