import 'dart:convert';

import 'package:number_trivia/modules/number_trivia/domain/entities/result_number_trivia.dart';

class SearchNumberTriviaModel extends SearchNumberTriviaResult
    with SearchNumberTriviaModelMixin {
  SearchNumberTriviaModel({required String text, required int number})
      : super(text: text, number: number);
  Map<String, dynamic> toMap() => {
        "number": number,
        "text": text,
      };

  String toJson() => jsonEncode(toMap());

  SearchNumberTriviaModel.fromJson(Map json)
      : super(text: json["text"], number: json["number"]);
}

mixin SearchNumberTriviaModelMixin {}
