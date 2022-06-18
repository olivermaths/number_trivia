import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/modules/number_trivia/apis/numbersapi_datasource.dart';
import 'package:number_trivia/modules/number_trivia/data/datasources/search_datasource.dart';
import 'package:number_trivia/modules/number_trivia/data/repositories/search_repository_impl.dart';
import 'package:number_trivia/modules/number_trivia/domain/entities/result_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:number_trivia/modules/number_trivia/domain/repositories/search_repository.dart';
import 'package:number_trivia/modules/number_trivia/domain/usecases/search_number_trivia_by_text.dart';
import 'package:number_trivia/modules/number_trivia/errors/failure.dart';

class FakeSearchRepository implements SearchRepository {
  @override
  Future<Either<Failure, SearchNumberTriviaResult>> search(
      String searchtext) async {
    if (searchtext.isEmpty) {
      return Left(DatasourceError());
    } else {
      return Right(SearchNumberTriviaResult(
          text: "curiosity :))", number: int.parse(searchtext)));
    }
  }
}

void main() {
  SearchNumberTriviaByText usecase =
      SearchNumberTriviaByTextImpl(FakeSearchRepository());
  SearchDatasource datasource = NumbersApiDataSource();
  SearchNumberTriviaByText realusecase =
      SearchNumberTriviaByTextImpl(SearchRepositoryImpl(datasource));

  test("return LEFT on error", () async {
    var result = await usecase("");
    expect(result, isA<Left>());
  });
  test("return Right on succed", () async {
    var result = await usecase("8");
    expect(result, isA<Right>());
  });

  test("return LEFT on error", () async {
    var result = await realusecase("not a number");
    expect(result, isA<Left>());
  });
  test("return Right on succed", () async {
    var result = await realusecase("69");
    expect(result, isA<Right>());
  });
}
