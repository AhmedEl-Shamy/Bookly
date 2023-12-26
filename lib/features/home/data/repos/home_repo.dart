import 'package:bookly/core/failure/failure.dart';
import 'package:bookly/core/utlis/either_type.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
}