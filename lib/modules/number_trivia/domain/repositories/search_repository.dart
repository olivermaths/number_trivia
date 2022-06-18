import 'package:dartz/dartz.dart';

import '../../errors/failure.dart';
import '../entities/result_number_trivia.dart';

abstract class SearchRepository {
  Future<Either<Failure, SearchNumberTriviaResult>> search(String searchtext);
}
