import 'package:bookly/core/usecases/usecase_with_parameter.dart';
import 'package:bookly/core/utlis/failure.dart';
import 'package:bookly/core/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

import '../repositories/home_repo.dart';

class FetchNewestBooksPaginationUseCase extends UseCaseWithParameter<List<BookEntity>, int> {
  final HomeRepo _homeRepo;

  FetchNewestBooksPaginationUseCase({required HomeRepo homeRepo}) : _homeRepo = homeRepo;
  
  @override
  Future<Either<Failure, List<BookEntity>>> call(int p) {
    return _homeRepo.fetchNewestBooks(startIndex: p);
  }


}