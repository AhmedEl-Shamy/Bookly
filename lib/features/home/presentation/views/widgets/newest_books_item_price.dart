import 'package:flutter/material.dart';

import '../../../../../core/utlis/text_styles.dart';
import 'book_rating.dart';

class BestSellerItemPrice extends StatelessWidget {
  const BestSellerItemPrice({
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
