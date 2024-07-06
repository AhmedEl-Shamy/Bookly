import 'package:flutter/material.dart';

import '../../../../core/entities/book_entity.dart';
import 'recomendation_list_item.dart';

class RecommendationBooksListView extends StatelessWidget {
  const RecommendationBooksListView({
    super.key,
    required this.books,
    required this.scrollController,
  });
  final List<BookEntity> books;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        controller: scrollController,
        padding: EdgeInsets.zero,
        itemCount: books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => RecomendationListItem(books[index]),
      ),
    );
  }
}