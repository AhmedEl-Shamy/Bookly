import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/book_item.dart';
import '../../../../core/entities/book_entity.dart';
import '../../../../core/widgets/loading_widgets/book_item_loading.dart';
import '../controllers/newest_books_cubit/newest_books_cubit.dart';

class NewestBooksSliverList extends StatefulWidget {
  const NewestBooksSliverList({
    super.key,
    required this.books, required this.isLoading, required this.scrollController,
  });
  final List<BookEntity> books;
  final bool isLoading;
  final ScrollController scrollController;

  @override
  State<NewestBooksSliverList> createState() => _NewestBooksSliverListState();
}

class _NewestBooksSliverListState extends State<NewestBooksSliverList> {
  @override
  void initState() {
    widget.scrollController.addListener(_listener);
    super.initState();
  }

  void _listener() {
    final double currentOffset = widget.scrollController.offset;
    final double scrollSize = widget.scrollController.position.maxScrollExtent;
    if (currentOffset >= scrollSize * 0.7 &&
        widget.books.isNotEmpty &&
        !widget.isLoading) {
      BlocProvider.of<NewestBooksCubit>(context)
          .getNewestBooksPagination(
        widget.books.length,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return  SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (widget.books.length <= index) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: BookItemLoading(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: BookItem(widget.books[index]),
            );
          }
        },
        childCount: widget.books.length + (widget.isLoading? 10 : 0),
      ),
    );
  }
}