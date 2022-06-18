import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:number_trivia/modules/number_trivia/data/models/search_number_trivia_result_model.dart';
import 'package:number_trivia/modules/number_trivia/presentation/screens/display_trivia_screen.dart';

import '../../domain/usecases/search_number_trivia_by_text.dart';

class SearchController {
  final SearchNumberTriviaByText searchUsecase;
  SearchController(this.searchUsecase);

  search(String text) async {
    var result = await searchUsecase(text);
    if (result.isRight()) {
      var triviaResult = result.fold(id, id);
      triviaResult as SearchNumberTriviaModel;
      Get.to(() =>
          DisplayTrivia(number: triviaResult.number, text: triviaResult.text));
    }
  }
}
