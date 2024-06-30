import 'package:hive_flutter/hive_flutter.dart';

import '../../features/home/domain/entities/book_entity_adapter.dart';

abstract class DBService<T> {
  List<T> fetchAllBoxData (String boxName);
  Future<void> chacheListData (String boxName, List<T> data);
}

class DBServiceImpl<T> extends DBService<T>{
  static const String hiveFeaturedBoxName = 'fBooksBox';
  static const String hiveNewestBoxName = 'nBooksBox';

  static void initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(BookEntityAdapter());
    await Hive.openBox(hiveFeaturedBoxName);
    await Hive.openBox(hiveNewestBoxName);
  }
  
  @override
  Future<void> chacheListData(String boxName, List<T> data) async {
    Box box = Hive.box(boxName);
    await box.addAll(data);
  }
  
  @override
  List<T> fetchAllBoxData(String boxName) {
    Box box = Hive.box(boxName);
    return box.values.toList().cast<T>();
  }
}
