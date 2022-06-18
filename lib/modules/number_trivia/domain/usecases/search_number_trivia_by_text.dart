import 'package:dartz/dartz.dart';
import 'package:number_trivia/modules/number_trivia/domain/repositories/search_repository.dart';
import '../../errors/failure.dart';
import '../entities/result_number_trivia.dart';

abstract class SearchNumberTriviaByText {
  Future<Either<Failure, SearchNumberTriviaResult>> call(String searchtext);
}

class SearchNumberTriviaByTextImpl implements SearchNumberTriviaByText {
  final SearchRepository repository;
  SearchNumberTriviaByTextImpl(this.repository);

  @override
  Future<Either<Failure, SearchNumberTriviaResult>> call(
      String searchtext) async {
    if (searchtext.isEmpty) {
      return Left(InvalidTextError());
    }

    return repository.search(searchtext);
  }
}
