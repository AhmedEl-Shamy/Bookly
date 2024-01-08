import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/core/utlis/either_type.dart';
import 'package:bookly/core/utlis/failure.dart';

abstract class SearchRepo{
  Future<Either<Failure,List<BookModel>>> fetchSearchData(String searchStr);
}