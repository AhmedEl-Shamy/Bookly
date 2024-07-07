import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/book_item.dart';
import '../../../../core/entities/book_entity.dart';
import '../../../../core/widgets/loading_widgets/book_item_loading.dart';
import '../controllers/search_data_cubit.dart';

class SearchResultsListView extends StatefulWidget {
  const SearchResultsListView({
    super.key,
    required this.books,
    required this.isLoading,
  });

  final List<BookEntity> books;
  final bool isLoading;
  @override
  State<SearchResultsListView> createState() => _SearchResultsListViewState();
}

class _SearchResultsListViewState extends State<SearchResultsListView> {
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
      BlocProvider.of<SearchDataCubit>(context)
          .fetchSearchPaginationData(widget.books.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        itemBuilder: (context, index) {
          if (widget.books.length <= index) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: BookItemLoading(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: BookItem(widget.books[index]),
            );
          }
        },
        itemCount: widget.books.length + ((widget.isLoading) ? 10 : 0),
      ),
    );
  }
}
