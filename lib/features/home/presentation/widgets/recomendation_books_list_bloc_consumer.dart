import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_error_widget.dart';
import '../../../../core/entities/book_entity.dart';
import '../controllers/recommendation_books_cubit/recommendation_books_cubit.dart';
import 'recommendation_books_list_view.dart';

class RecomendationListBlocConsumer extends StatelessWidget {
  const RecomendationListBlocConsumer({
    super.key,
    required this.book, required this.books,
  });
  final BookEntity book;
  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecommendationBooksCubit, RecommendationBooksState>(
      listenWhen: (previous, current) =>
          !(previous is RecommendationBooksLoading &&
              current is RecommendationBooksLoading),
      buildWhen: (previous, current) =>
          !(previous is RecommendationBooksLoading &&
              current is RecommendationBooksLoading),
      listener: (context, state) {
        // if (state is RecommendationBooksSuccess) {
        //   books.addAll(state.books);
        // }
      },
      builder: (context, state) {
        if (state is RecommendationBooksSuccess) {
          return RecommendationBooksListView(
            books: books,
            book: book,
            isLoading: false,
          );
        } else if (state is RecommendationBooksFaild) {
          return CustomErrorWidget(state.failure.errorMsg);
        } else if (state is RecommendationBooksPaginationField) {
          return RecommendationBooksListView(
            books: books,
            book: book,
            isLoading: false,
          );
        } else {
          return RecommendationBooksListView(
            books: books,
            book: book,
            isLoading: true,
          );
        }
      },
    );
  }
}
