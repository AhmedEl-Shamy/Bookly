import 'package:bookly/core/utlis/failure.dart';
import 'package:bookly/core/utlis/either_type.dart';

import '../entities/book_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks();
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookEntity>>> fetchRecomendationBooks({required String category});
}