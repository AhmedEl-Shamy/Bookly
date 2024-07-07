import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/features/search/presentation/controllers/search_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/book_entity.dart';
import 'search_data_list_view.dart';

class SearchResultsListViewBlocConsumer extends StatelessWidget {
  SearchResultsListViewBlocConsumer({
    super.key,
  });
  final List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchDataCubit, SearchState>(
      listenWhen: (previous, current) =>
          !(previous is SearchLoading && current is SearchLoading),
      buildWhen: (previous, current) =>
          !(previous is SearchLoading && current is SearchLoading),
      listener: (context, state) {
        if (state is SearchSuccess) {
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is SearchSuccess) {
          return SearchResultsListView(
            books: books,
            isLoading: false,
          );
        } else if (state is SearchFailure) {
          return CustomErrorWidget(state.failure.errorMsg);
        } else if (state is SearchLoading) {
          return SearchResultsListView(
            books: books,
            isLoading: true,
          );
        } else if (state is SearchPaginationFailure) {
          return SearchResultsListView(
            books: books,
            isLoading: false,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
