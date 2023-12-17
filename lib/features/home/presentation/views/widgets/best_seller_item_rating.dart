import 'package:bookly/core/utlis/colors.dart';
import 'package:bookly/core/utlis/text_styles.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: ThemeColors.ratingStarColor,
          size: 16,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          '4.8',
          style: TextStyles.textStyle16.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          '(4355)',
          style: TextStyles.textStyle16
              .copyWith(color: ThemeColors.secondaryTextColor),
        ),
      ],
    );
  }
}
