import 'package:bookly/core/usecases/usecase_with_parameter.dart';
import 'package:bookly/core/utlis/failure.dart';
import 'package:bookly/features/search/domain/repositories/search_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../home/domain/entities/book_entity.dart';

class FetchSearchDataPaginationUseCase extends UseCaseWithParameter<List<BookEntity>, Map<String, dynamic>>{
  final SearchRepo _searchRepo;

  FetchSearchDataPaginationUseCase({required SearchRepo searchRepo}) : _searchRepo = searchRepo;
  
  @override
  Future<Either<Failure, List<BookEntity>>> call(Map<String, dynamic> p) {
    return _searchRepo.fetchSearchData(searchStr: p['searchStr'], startIndex: p['startIndex']);
  }



}