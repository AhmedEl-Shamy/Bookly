import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utlis/assets.dart';
import '../../../../../core/utlis/colors.dart';
import '../../../../../core/utlis/text_styles.dart';

class BookDetailsInfo extends StatelessWidget {
  const BookDetailsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'The Jungle Book',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyles.title.copyWith(
            fontFamily: AssetsData.gTSectraFineFamily,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'Rudyard Kipling',
          style: TextStyles.textStyle18.copyWith(
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
