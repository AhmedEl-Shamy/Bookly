import 'package:bookly/core/entities/book_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/utlis/text_styles.dart';
import 'recomendation_books_list_bloc_consumer.dart';

class RecomendationListSection extends StatelessWidget {
  const RecomendationListSection({
    super.key, required this.book,
  });
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            'You can see also',
            style: TextStyles.textStyle14.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        RecomendationListBlocConsumer(
          book: book,
          scrollController: ScrollController(),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
