import 'package:bookly/core/services/api_service.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utlis/failure.dart';
import '../../../home/domain/entities/book_entity.dart';

abstract class SearchRemoteDataSource {
  Future<Either<Failure, List<BookEntity>>> fetchSearchData({
    required String searchStr,
    int startIndex = 0,
  });
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiService _apiService;

  SearchRemoteDataSourceImpl({required ApiService apiService})
      : _apiService = apiService;

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSearchData({
    required String searchStr,
    int startIndex = 0,
  }) async {
    try {
      Map<String, dynamic> data = await _apiService.get(
        endPoint:
            '/volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:$searchStr&startIndex=$startIndex',
      );
      List<BookEntity> books = getBookList(data);
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  List<BookEntity> getBookList(Map<String, dynamic> data) {
    List<BookEntity> books = List.empty(growable: true);
    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
    }
    return books;
  }
}
