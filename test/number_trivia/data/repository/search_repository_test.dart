import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/modules/number_trivia/apis/numbersapi_datasource.dart';
import 'package:number_trivia/modules/number_trivia/data/datasources/search_datasource.dart';
import 'package:number_trivia/modules/number_trivia/data/models/search_number_trivia_result_model.dart';
import 'package:number_trivia/modules/number_trivia/data/repositories/search_repository_impl.dart';
import 'package:dartz/dartz.dart';

class FakeSearchDataSource implements SearchDatasource {
  @override
  Future<SearchNumberTriviaModel> getSearch(String searchText) {
    throw UnimplementedError();
  }
}

void main() {
  SearchDatasource datasource = NumbersApiDataSource();
  SearchDatasource fakeDatasource = FakeSearchDataSource();
  SearchRepositoryImpl realRepository = SearchRepositoryImpl(datasource);
  SearchRepositoryImpl fakeRepository = SearchRepositoryImpl(fakeDatasource);
  test("return Left on error", () async {
    var reponse = await fakeRepository.search("");
    expect(reponse, isA<Left>());
  });

  test("return Left on invalid input", () async {
    var result = await realRepository.search("not a number");
    expect(result, isA<Left>());
  });
  test("return Right on succed", () async {
    var result = await realRepository.search("69");
    expect(result, isA<Right>());
  });
}
