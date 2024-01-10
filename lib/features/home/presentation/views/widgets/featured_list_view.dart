import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_progress_indicator.dart';
import 'package:bookly/core/widgets/loading_widgets/featured_books_list_loading.dart';
import 'package:bookly/features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
          if (state is FeaturedBooksSuccess) {
            return ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(5),
                child: FeaturedListViewItem(
                  state.books[index],
                ),
              ),
            );
          } else if (state is FeaturedBooksFailed) {
            return CustomErrorWidget(state.failure.errorMsg);
          } else {
            // return const CustomProgressIndicator();
            return const FeaturedBooksListLoading();
          }
        },
      ),
    );
  }
}
