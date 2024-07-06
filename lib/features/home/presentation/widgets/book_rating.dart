import 'package:bookly/core/utlis/colors.dart';
import 'package:bookly/core/utlis/text_styles.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          color: ThemeColors.ratingStarColor,
          size: 24,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          '4.8',
          style: TextStyles.textStyle18.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          '(4355)',
          style: TextStyles.textStyle18
              .copyWith(color: ThemeColors.secondaryTextColor),
        ),
      ],
    );
  }
}
