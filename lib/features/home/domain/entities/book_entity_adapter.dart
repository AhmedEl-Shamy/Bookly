import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BookEntityAdapter extends TypeAdapter<BookEntity> {
  @override
  BookEntity read(BinaryReader reader) {
    return BookEntity(
      bookId: reader.readString(),
      name: reader.readString(),
      image: reader.readString(),
      authors: reader.readStringList(),
      rate: reader.readDouble(),
      price: reader.readDouble(),
    );
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, BookEntity obj) {
    writer.writeString(obj.bookId);
    writer.writeString(obj.name);
    writer.writeString(obj.image);
    writer.writeStringList(obj.authors?? []);
    writer.writeDouble(obj.price?? 0.0);
    writer.writeDouble(obj.rate?? 0.0);
  }
}
