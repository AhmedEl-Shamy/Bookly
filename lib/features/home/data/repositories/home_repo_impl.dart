import 'package:bookly/core/services/api_service.dart';
import 'package:bookly/core/utlis/either_type.dart';

import 'package:bookly/core/utlis/failure.dart';

import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:dio/dio.dart';

import '../../domain/repositories/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService _apiService;
  HomeRepoImpl(this._apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      Map<String, dynamic> data = await _apiService.get(
        endPoint: '/volumes?Filtering=free-ebooks&q=programming&Sorting=newest',
      );
      List<BookModel> books = List.empty(growable: true);
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Either(data: books);
    } on Exception catch (e) {
      if (e is DioException) {
        return Either(
          error: ServerFailure.fromDioException(e),
        );
      }
      return Either(error: ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      Map<String, dynamic> data = await _apiService.get(
        endPoint: '/volumes?Filtering=free-ebooks&q=programming',
      );
      List<BookModel> books = List.empty(growable: true);
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Either(data: books);
    } on Exception catch (e) {
      if (e is DioException) {
        return Either(
          error: ServerFailure.fromDioException(e),
        );
      }
      return Either(error: ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<BookModel>>> fetchRecomendationBooks({required String category}) async {
    try {
      Map<String, dynamic> data = await _apiService.get(
        endPoint: '/volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:$category',
      );
      List<BookModel> books = List.empty(growable: true);
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Either(data: books);
    } on Exception catch (e) {
      if (e is DioException) {
        return Either(
          error: ServerFailure.fromDioException(e),
        );
      }
      return Either(error: ServerFailure(e.toString()));
    }
  }
}