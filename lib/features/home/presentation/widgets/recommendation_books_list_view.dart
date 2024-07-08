import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/book_entity.dart';
import '../controllers/recommendation_books_cubit/recommendation_books_cubit.dart';
import 'recommendation_list_item_loading.dart';
import 'recomendation_list_item.dart';

class RecommendationBooksListView extends StatefulWidget {
  const RecommendationBooksListView({
    super.key,
    required this.books,
    required this.book,
    required this.isLoading,
  });
  final List<BookEntity> books;
  final BookEntity book;
  final bool isLoading;

  @override
  State<RecommendationBooksListView> createState() =>
      _RecommendationBooksListViewState();
}

class _RecommendationBooksListViewState
    extends State<RecommendationBooksListView> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _listener() {
    final double currentOffset = scrollController.offset;
    final double scrollSize = scrollController.position.maxScrollExtent;
    if (currentOffset >= scrollSize * 0.7 &&
        widget.books.isNotEmpty &&
        !widget.isLoading) {
      BlocProvider.of<RecommendationBooksCubit>(context)
          .getRecommendationPaginationBooks(
        widget.book.category,
        widget.books.length,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (widget.books.length <= index) {
            return const RecomendationListItemLoading();
          } else {
            return RecomendationListItem(widget.books[index]);
          }
        },
        itemCount: widget.books.length + (widget.isLoading? 10 : 0),
      ),
    );
  }
}
