import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/modules/number_trivia/apis/numbersapi_datasource.dart';
import 'package:number_trivia/modules/number_trivia/data/datasources/search_datasource.dart';
import 'package:number_trivia/modules/number_trivia/domain/entities/result_number_trivia.dart';

void main() {
  SearchDatasource datasourceApi = NumbersApiDataSource();
  test("expected to return a exception", () async {
    expect(() async => await datasourceApi.getSearch("not a number"),
        throwsException);
  });
  test("expected to return a TriviaResult", () async {
    var result = await datasourceApi.getSearch("9");
    expect(result, isA<SearchNumberTriviaResult>());
  });
}
