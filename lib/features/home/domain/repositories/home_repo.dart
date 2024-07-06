import 'package:bookly/core/utlis/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/entities/book_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks({
    int startIndex = 0,
  });
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookEntity>>> fetchRecommendationBooks({
    required String category,
    int startIndex = 0,
  });
}
