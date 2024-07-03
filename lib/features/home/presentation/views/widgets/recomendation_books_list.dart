import 'package:bookly/core/widgets/loading_widgets/recommendation_list_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error_widget.dart';
import '../../controllers/recommendation_books_cubit/recommendation_books_cubit.dart';
import 'recomendation_list_item.dart';

class RecomendationList extends StatelessWidget {
  const RecomendationList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecomendationBooksCubit, RecomendationBooksState>(
      builder: (context, state) {
        if (state is RecomendationBooksSuccess) {
          return SizedBox(
            height: 150,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  RecomendationListItem(state.books[index]),
            ),
          );
        } else if (state is RecomendationBooksFaild) {
          return CustomErrorWidget(state.failure.errorMsg);
        } else {
          return const SizedBox(
            height: 150,
            child: RecommendationListLoading(),
          );
        }
      },
    );
  }
}
