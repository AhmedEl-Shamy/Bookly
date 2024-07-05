import 'package:bookly/core/usecases/usecase_with_parameter.dart';
import 'package:bookly/core/utlis/failure.dart';
import 'package:bookly/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../entities/book_entity.dart';

class FetchRecommendationBooksUseCase extends UseCaseWithParameter<List<BookEntity>, String>  {
  final HomeRepo _homeRepo;

  FetchRecommendationBooksUseCase({
    required HomeRepo homeRepo,
  }) : _homeRepo = homeRepo;
  
  @override
  Future<Either<Failure, List<BookEntity>>> call(String p) {
    return _homeRepo.fetchRecommendationBooks(category: p);
  }
}
