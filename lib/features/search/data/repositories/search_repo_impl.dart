import 'package:bookly/features/search/data/data_sources/serch_remote_data_source.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utlis/failure.dart';
import '../../../../core/entities/book_entity.dart';
import '../../domain/repositories/search_repo.dart';

class SearchRepoImpl extends SearchRepo {
  final SearchRemoteDataSource _searchRemoteDataSource;

  SearchRepoImpl({required SearchRemoteDataSource searchRemoteDataSource})
      : _searchRemoteDataSource = searchRemoteDataSource;

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSearchData({
    required String searchStr,
    int startIndex = 0,
  }) async {
    return _searchRemoteDataSource.fetchSearchData(searchStr: searchStr, startIndex: startIndex);
  }
}
