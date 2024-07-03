import 'package:bookly/core/utlis/failure.dart';
import 'package:bookly/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/features/home/data/data_sources/home_remote_data_source.dart';

import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/repositories/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeLocalDataSource _homeLocalDataSource;
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepoImpl({
    required HomeLocalDataSource homeLocalDataSource,
    required HomeRemoteDataSource homeRemoteDataSource,
  })  : _homeLocalDataSource = homeLocalDataSource,
        _homeRemoteDataSource = homeRemoteDataSource;

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      List<BookEntity> books = _homeLocalDataSource.fetchFeaturedBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await _homeRemoteDataSource.fetchFeaturedBooks();
      await _homeLocalDataSource.cachFeaturedBooks(books);
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> books = _homeLocalDataSource.fetchNewestBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await _homeRemoteDataSource.fetchNewestBooks();
      await _homeLocalDataSource.cachNewestBooks(books);
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchRecomendationBooks({
    required String category,
  }) async {
    try {
      List<BookEntity> books = await _homeRemoteDataSource.fetchRecomendationBooks(category);
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    }
  }
}
