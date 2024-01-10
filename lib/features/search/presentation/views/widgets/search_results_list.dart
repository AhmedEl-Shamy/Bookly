import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_progress_indicator.dart';
import 'package:bookly/core/widgets/loading_widgets/book_item_list_Loading.dart';
import 'package:bookly/features/search/presentation/view_models/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/book_item.dart';

class SearchResultsList extends StatelessWidget {
  const SearchResultsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: BookItem(state.books[index]),
              ),
              itemCount: state.books.length,
            ),
          );
        } else if (state is SearchFailure) {
          return CustomErrorWidget(state.failure.errorMsg);
        } else if (state is SearchLoading) {
          return const Expanded(
            child: BookItemListLoading(),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
