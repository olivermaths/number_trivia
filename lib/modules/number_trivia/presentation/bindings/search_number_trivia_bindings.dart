import 'package:get/instance_manager.dart';
import 'package:number_trivia/modules/number_trivia/data/repositories/search_repository_impl.dart';
import 'package:number_trivia/modules/number_trivia/domain/repositories/search_repository.dart';
import 'package:number_trivia/modules/number_trivia/domain/usecases/search_number_trivia_by_text.dart';
import 'package:number_trivia/modules/number_trivia/presentation/controllers/search_controller.dart';

import '../../apis/numbersapi_datasource.dart';

class SearchNumberTriviaBindings implements Bindings {
  SearchController initSearchController() {
    NumbersApiDataSource dataSource = NumbersApiDataSource();
    SearchRepository repository = SearchRepositoryImpl(dataSource);
    SearchNumberTriviaByText usecase = SearchNumberTriviaByTextImpl(repository);
    return SearchController(usecase);
  }

  @override
  void dependencies() {
    Get.put<SearchController>(initSearchController());
  }
}
