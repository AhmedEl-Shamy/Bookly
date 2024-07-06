import 'package:bookly/core/utlis/failure.dart';
import 'package:bookly/core/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookEntity>>> fetchSearchData({
    required String searchStr,
    int startIndex = 0,
  });
}
