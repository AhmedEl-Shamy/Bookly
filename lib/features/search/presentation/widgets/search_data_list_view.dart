import 'package:flutter/material.dart';

import '../../../../core/widgets/book_item.dart';
import '../../../../core/entities/book_entity.dart';

class SearchResultsListView extends StatelessWidget {
  const SearchResultsListView({
    super.key,
    required this.books,
    required this.scrollController,
  });

  final List<BookEntity> books;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: BookItem(books[index]),
        ),
        itemCount: books.length,
      ),
    );
  }
}