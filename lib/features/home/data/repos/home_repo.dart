import 'package:bookly/core/utlis/failure.dart';
import 'package:bookly/core/utlis/either_type.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchRecomendationBooks({required String category});
}