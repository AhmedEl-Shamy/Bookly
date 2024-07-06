import 'package:bookly/core/services/db_service.dart';

import '../../../../core/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();
  Future<void> cachFeaturedBooks(List<BookEntity> books);
  Future<void> cachNewestBooks(List<BookEntity> books);
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  final DBService<BookEntity> _dbService;

  HomeLocalDataSourceImpl({required DBService<BookEntity> dbService})
      : _dbService = dbService;

  @override
  List<BookEntity> fetchFeaturedBooks() {
    return _dbService.fetchAllBoxData(DBServiceImpl.hiveFeaturedBoxName);
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    return _dbService.fetchAllBoxData(DBServiceImpl.hiveNewestBoxName);
  }

  @override
  Future<void> cachFeaturedBooks(List<BookEntity> books) async {
    await _dbService.chacheListData(DBServiceImpl.hiveFeaturedBoxName, books);
  }

  @override
  Future<void> cachNewestBooks(List<BookEntity> books) async {
    await _dbService.chacheListData(DBServiceImpl.hiveNewestBoxName, books);
  }
}
