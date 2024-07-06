import 'package:bookly/core/widgets/loading_widgets/recommendation_list_item_loading.dart';
import 'package:bookly/features/home/presentation/widgets/recomendation_list_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/entities/book_entity.dart';

class RecommendationListLoading extends StatelessWidget {
  const RecommendationListLoading({
    super.key,
    required this.books,
    required this.scrollController,
  });

  final List<BookEntity> books;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        if (books.length <= index) {
          return const RecomendationListItemLoading();
        } else {
          return RecomendationListItem(books[index]);
        }
      },
      itemCount: books.length + 10,
    );
  }
}
