import 'package:number_trivia/modules/number_trivia/data/datasources/search_datasource.dart';
import 'package:number_trivia/modules/number_trivia/domain/entities/result_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:number_trivia/modules/number_trivia/domain/repositories/search_repository.dart';
import 'package:number_trivia/modules/number_trivia/errors/failure.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDatasource datasource;
  SearchRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, SearchNumberTriviaResult>> search(
      String searchText) async {
    try {
      final result = await datasource.getSearch(searchText);
      return Right(result);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
