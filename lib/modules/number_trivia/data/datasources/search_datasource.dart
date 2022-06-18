import 'package:number_trivia/modules/number_trivia/data/models/search_number_trivia_result_model.dart';

abstract class SearchDatasource {
  Future<SearchNumberTriviaModel> getSearch(String searchText);
}
