import 'package:bookly/features/home/presentation/views/widgets/recommendation_list_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../domain/entities/book_entity.dart';
import '../../controllers/recommendation_books_cubit/recommendation_books_cubit.dart';
import 'recommendation_books_list_view.dart';

class RecomendationListBlocConsumer extends StatefulWidget {
  RecomendationListBlocConsumer({
    super.key,
    required this.scrollController,
    required this.book,
  });
  final BookEntity book;
  final List<BookEntity> books = [];
  final ScrollController scrollController;
  @override
  State<RecomendationListBlocConsumer> createState() =>
      _RecomendationListBlocConsumerState();
}

class _RecomendationListBlocConsumerState
    extends State<RecomendationListBlocConsumer> {
  @override
  void initState() {
    addScrollListener();
    super.initState();
  }

  void addScrollListener() {
    widget.scrollController.addListener(
      () {
        final double currentOffset = widget.scrollController.offset;
        final double maxScrollExtent =
            widget.scrollController.position.maxScrollExtent;
        if (currentOffset > maxScrollExtent * 0.7 && widget.books.isNotEmpty) {
          BlocProvider.of<RecommendationBooksCubit>(context)
              .getRecommendationPaginationBooks(
            widget.book.category,
            widget.books.length,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecommendationBooksCubit, RecommendationBooksState>(
      listener: (context, state) {
        if (state is RecommendationBooksSuccess) {
          widget.books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is RecommendationBooksSuccess) {
          return RecommendationBooksListView(
            scrollController: widget.scrollController,
            books: widget.books,
          );
        } else if (state is RecommendationBooksFaild) {
          return CustomErrorWidget(state.failure.errorMsg);
        } else if (state is RecommendationBooksPaginationField) {
          return RecommendationBooksListView(
            scrollController: widget.scrollController,
            books: widget.books,
          );
        } else {
          return SizedBox(
            height: 150,
            child: RecommendationListLoading(
              books: widget.books,
            ),
          );
        }
      },
    );
  }
}
