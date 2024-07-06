import 'package:flutter/material.dart';

import '../../../../core/widgets/book_item.dart';
import '../../../../core/widgets/loading_widgets/book_item_loading.dart';
import '../../../../core/entities/book_entity.dart';

class NewestBooksListLoading extends StatelessWidget {
  const NewestBooksListLoading({
    super.key,
    required this.books,
  });

  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (books.length <= index) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: BookItemLoading(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: BookItem(books[index]),
            );
          }
        },
        childCount: books.length + 10,
      ),
    );
  }
}