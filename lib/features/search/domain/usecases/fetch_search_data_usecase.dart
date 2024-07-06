import 'package:bookly/core/usecases/usecase_with_parameter.dart';
import 'package:bookly/core/utlis/failure.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/search/domain/repositories/search_repo.dart';
import 'package:dartz/dartz.dart';

class FetchSearchDataUsecase extends UseCaseWithParameter<List<BookEntity>, String> {
  final SearchRepo _searchRepo;

  FetchSearchDataUsecase({required SearchRepo searchRepo})
      : _searchRepo = searchRepo;

  @override
  Future<Either<Failure, List<BookEntity>>> call(String p) {
    return _searchRepo.fetchSearchData(searchStr: p);
  }
}
