import 'package:bookly/core/widgets/loading_widgets/book_item_loading.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/book_item.dart';
import '../../../home/domain/entities/book_entity.dart';

class BookItemListLoading extends StatelessWidget {
  const BookItemListLoading({
    super.key,
    required this.books,
    required this.scrollController,
  });
  final ScrollController scrollController;
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemBuilder: (context, index) {
        if (books.length <= index) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: BookItemLoading(),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: BookItem(books[index]),
          );
        }
      },
      itemCount: books.length + 10,
    );
  }
}
