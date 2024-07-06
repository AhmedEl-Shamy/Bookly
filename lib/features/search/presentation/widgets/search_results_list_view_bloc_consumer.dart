import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/features/search/presentation/widgets/book_item_list_loading.dart';
import 'package:bookly/features/search/presentation/controllers/search_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/book_entity.dart';
import 'search_data_list_view.dart';

class SearchResultsListViewBlocConsumer extends StatefulWidget {
  SearchResultsListViewBlocConsumer({
    super.key,
    required this.scrollController,
  });
  final List<BookEntity> books = [];
  final ScrollController scrollController;
  @override
  State<SearchResultsListViewBlocConsumer> createState() =>
      _SearchResultsListViewBlocConsumerState();
}

class _SearchResultsListViewBlocConsumerState
    extends State<SearchResultsListViewBlocConsumer> {
  @override
  void initState() {
    addScrollListener();
    super.initState();
  }

  void addScrollListener() {
    widget.scrollController.addListener(
      () {
        final double currentOffset = widget.scrollController.offset;
        final double scrollSize =
            widget.scrollController.position.maxScrollExtent;
        if (currentOffset == scrollSize * 0.7 && widget.books.isNotEmpty) {
          BlocProvider.of<SearchDataCubit>(context)
              .fetchSearchPaginationData(widget.books.length);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchDataCubit, SearchState>(
      listenWhen: (previous, current) =>
          !(previous is SearchLoading && current is SearchLoading),
      buildWhen: (previous, current) =>
          !(previous is SearchLoading && current is SearchLoading),

      listener: (context, state) {
        if (state is SearchSuccess) {
          widget.books.addAll(state.books);
        }
      },
      
      builder: (context, state) {
        if (state is SearchSuccess) {
          return SearchResultsListView(
            scrollController: widget.scrollController,
            books: widget.books,
          );
        } else if (state is SearchFailure) {
          return CustomErrorWidget(state.failure.errorMsg);
        } else if (state is SearchLoading) {
          return Expanded(
            child: BookItemListLoading(
              scrollController: widget.scrollController,
              books: widget.books,
            ),
          );
        } else if (state is SearchPaginationFailure) {
          return SearchResultsListView(
            scrollController: widget.scrollController,
            books: widget.books,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
