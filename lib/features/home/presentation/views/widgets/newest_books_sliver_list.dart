import 'package:flutter/material.dart';

import '../../../../../core/widgets/book_item.dart';
import '../../../domain/entities/book_entity.dart';

class NewestBooksSliverList extends StatelessWidget {
  const NewestBooksSliverList({
    super.key,
    required this.books,
  });
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          child: BookItem(books[index]),
        ),
        childCount: books.length,
      ),
    );
  }
}