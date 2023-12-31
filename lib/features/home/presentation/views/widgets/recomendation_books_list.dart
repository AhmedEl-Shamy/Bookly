import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/custom_progress_indicator.dart';
import '../../view_models/cubit/recomendation_books_cubit.dart';
import 'book_image.dart';

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
              itemBuilder: (context, index) => RecomendationListItem(state.books[index]),
            ),
          );
        } else if (state is RecomendationBooksFaild) {
          return CustomErrorWidget(state.failure.errorMsg);
        } else {
          return const CustomProgressIndicator();
        }
      },
    );
  }
}

class RecomendationListItem extends StatelessWidget {
  const RecomendationListItem(
    this.book, {
    super.key,
  });
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BookImage(
          imageUrl: book.volumeInfo?.imageLinks?.thumbnail ?? '',
          aspectRatio: 70 / 112,
          height: 112,
        ),
      ),
    );
  }
}
