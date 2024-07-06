import 'package:bookly/core/usecases/usecase_with_parameter.dart';
import 'package:bookly/core/utlis/failure.dart';
import 'package:bookly/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/entities/book_entity.dart';

class FetchRecommendationBooksPaginationUseCase extends UseCaseWithParameter<List<BookEntity>, Map<String, dynamic>> {
  final HomeRepo _homeRepo;

  FetchRecommendationBooksPaginationUseCase({required HomeRepo homeRepo})
      : _homeRepo = homeRepo;

  @override
  Future<Either<Failure, List<BookEntity>>> call(Map<String, dynamic> p) {
    return _homeRepo.fetchRecommendationBooks(category: p['category'], startIndex: p['startIndex']);
  }
}
