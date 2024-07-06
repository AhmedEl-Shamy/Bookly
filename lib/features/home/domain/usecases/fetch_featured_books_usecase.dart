import 'package:bookly/core/utlis/failure.dart';
import 'package:bookly/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../core/entities/book_entity.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>>  {
  final HomeRepo _homeRepo;

  FetchFeaturedBooksUseCase({
    required HomeRepo homeRepo,
  }) : _homeRepo = homeRepo;
  
  @override
  Future<Either<Failure, List<BookEntity>>> call() {
    return _homeRepo.fetchFeaturedBooks();
  }
}