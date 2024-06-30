import 'package:bookly/core/services/api_service.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';

import '../models/book_model/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks(String endPoint);
  Future<List<BookEntity>> fetchNewestBooks(String endPoint);
  Future<List<BookEntity>> fetchRecomendationBooks(
      String endPoint, String category);
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService _apiService;

  HomeRemoteDataSourceImpl({required ApiService apiService})
      : _apiService = apiService;

  @override
  Future<List<BookEntity>> fetchFeaturedBooks(String endPoint) async {
    Map<String, dynamic> data = await _apiService.get(
      endPoint: '/volumes?Filtering=free-ebooks&q=programming',
    );
    List<BookEntity> books = getBookList(data);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks(String endPoint) async {
    Map<String, dynamic> data = await _apiService.get(
      endPoint: '/volumes?Filtering=free-ebooks&q=programming&Sorting=newest',
    );

    List<BookEntity> books = getBookList(data);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchRecomendationBooks(
      String endPoint, String category) async {
    Map<String, dynamic> data = await _apiService.get(
      endPoint:
          '/volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:$category',
    );
    List<BookEntity> books = getBookList(data);
    return books;
  }

  List<BookEntity> getBookList(Map<String, dynamic> data) {
    List<BookEntity> books = List.empty(growable: true);
    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
    }
    return books;
  }
}
