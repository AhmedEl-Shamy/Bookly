import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/features/home/presentation/controllers/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/book_entity.dart';
import 'newest_books_sliver_list.dart';

class NewestBooksListSliverBlocConsumer extends StatelessWidget {
  const NewestBooksListSliverBlocConsumer({
    super.key,
    required ScrollController scrollController,
    required this.books,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;
  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listenWhen: (previous, current) =>
          !(previous is NewestBooksLoading && current is NewestBooksLoading),
      buildWhen: (previous, current) =>
          !(previous is NewestBooksLoading && current is NewestBooksLoading),
      listener: (context, state) {},
      
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return NewestBooksSliverList(
            scrollController: _scrollController,
            isLoading: false,
            books: books,
          );
        } else if (state is NewestBooksFailed) {
          return SliverFillRemaining(
            child: CustomErrorWidget(state.failure.errorMsg),
          );
        } else if (state is NewestBooksPaginationFailed) {
          return NewestBooksSliverList(
            scrollController: _scrollController,
            isLoading: false,
            books: books,
          );
        } else {
          return NewestBooksSliverList(
            scrollController: _scrollController,
            books: books,
            isLoading: true,
          );
        }
      },
    );
  }
}
