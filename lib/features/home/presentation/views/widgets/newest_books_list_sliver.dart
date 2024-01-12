import 'package:bookly/core/widgets/book_item.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/loading_widgets/book_item_loading.dart';
import 'package:bookly/features/home/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListSliver extends StatelessWidget {
  const BestSellerListSliver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                child: BookItem(state.books[index]),
              ),
              childCount: state.books.length,
            ),
          );
        } else if (state is NewestBooksFailed) {
          return SliverFillRemaining(
            child: CustomErrorWidget(state.failure.errorMsg),
          );
        } else {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => const Padding(
                padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                child: BookItemLoading(),
              ),
              childCount: 15,
            ),
          );
        }
      },
    );
  }
}
