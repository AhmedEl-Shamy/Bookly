import 'package:bookly/core/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/widgets/book_rating.dart';
import 'package:flutter/material.dart';

import '../../../../core/utlis/assets.dart';
import '../../../../core/utlis/colors.dart';
import '../../../../core/utlis/text_styles.dart';

class BookDetailsInfo extends StatelessWidget {
  const BookDetailsInfo(this.book, {super.key});

  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          book.name,
          textAlign: TextAlign.center,
          style: TextStyles.titleMedium.copyWith(
            fontFamily: AssetsData.gTSectraFineFamily,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          book.authors?.join(' | ') ?? '',
          textAlign: TextAlign.center,
          style: TextStyles.textStyle16.copyWith(
            fontWeight: FontWeight.w600,
            color: ThemeColors.secondaryTextColor,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const BookRating(),
      ],
    );
  }
}
