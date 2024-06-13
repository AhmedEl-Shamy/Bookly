import 'package:bookly/core/usecases/usecase_with_parameter.dart';
import 'package:bookly/core/utlis/either_type.dart';
import 'package:bookly/core/utlis/failure.dart';
import 'package:bookly/features/home/domain/repositories/home_repo.dart';

import '../entities/book_entity.dart';

class FetchRecomendationBooksUseCase extends UseCase<List<BookEntity>, String>  {
  final HomeRepo _homeRepo;

  FetchRecomendationBooksUseCase({
    required HomeRepo homeRepo,
  }) : _homeRepo = homeRepo;
  
  @override
  Future<Either<Failure, List<BookEntity>>> call(String p) {
    return _homeRepo.fetchRecomendationBooks(category: p);
  }
}
