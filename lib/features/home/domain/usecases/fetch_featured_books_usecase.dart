import 'package:bookly/core/utlis/either_type.dart';
import 'package:bookly/core/utlis/failure.dart';
import 'package:bookly/features/home/domain/repositories/home_repo.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/book_entity.dart';

class FetchRecomendationBooksUseCase extends UseCase<List<BookEntity>>  {
  final HomeRepo _homeRepo;

  FetchRecomendationBooksUseCase({
    required HomeRepo homeRepo,
  }) : _homeRepo = homeRepo;
  
  @override
  Future<Either<Failure, List<BookEntity>>> call() {
    return _homeRepo.fetchFeaturedBooks();
  }
}