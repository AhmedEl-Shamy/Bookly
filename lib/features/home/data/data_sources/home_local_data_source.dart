import 'package:bookly/core/utlis/constans.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();
  Future<void> cacheBooks({required List<BookEntity> books, required String boxName});
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    Box box = Hive.box(Constans.hiveFeaturedBoxName);
    return box.values.toList().cast<BookEntity>();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    Box box = Hive.box(Constans.hiveNewestBoxName);
    return box.values.toList().cast<BookEntity>();
  }
  
  @override
  Future<void> cacheBooks({required List<BookEntity> books, required String boxName}) async {
    Box box = Hive.box(boxName);
    await box.addAll(books);
  }

}