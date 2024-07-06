import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/features/home/presentation/controllers/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';
import 'newest_books_list_loading.dart';
import 'newest_books_sliver_list.dart';

class NewestBooksListSliverBlocConsumer extends StatefulWidget {
  NewestBooksListSliverBlocConsumer({
    super.key,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;
  final List<BookEntity> books = [];

  @override
  State<NewestBooksListSliverBlocConsumer> createState() =>
      _NewestBooksListSliverBlocConsumerState();
}

class _NewestBooksListSliverBlocConsumerState
    extends State<NewestBooksListSliverBlocConsumer> {
  @override
  void initState() {
    super.initState();
    addScrollListener();
  }

  void addScrollListener() {
    widget._scrollController.addListener(
      () {
        final double currentOffset = widget._scrollController.offset;
        final double scrollSize =
            widget._scrollController.position.maxScrollExtent;
        if (currentOffset == scrollSize * 0.7 && widget.books.isNotEmpty) {
          BlocProvider.of<NewestBooksCubit>(context).getNewestBooksPagination(
            widget.books.length,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {
        if (state is NewestBooksSuccess) {
          widget.books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return NewestBooksSliverList(
            books: state.books,
          );
        } else if (state is NewestBooksFailed) {
          return SliverFillRemaining(
            child: CustomErrorWidget(state.failure.errorMsg),
          );
        } else if (state is NewestBooksPaginationFailed) {
          return NewestBooksSliverList(
            books: widget.books,
          );
        } else {
          return NewestBooksListLoading(books: widget.books);
        }
      },
    );
  }
}
