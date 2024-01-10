import 'package:flutter/material.dart';

import '../utlis/text_styles.dart';
import '../../features/home/presentation/views/widgets/book_rating.dart';

class NewestBooksItemPrice extends StatelessWidget {
  const NewestBooksItemPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Free',
          style: TextStyles.titleMedium.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const BookRating(),
      ],
    );
  }
}
