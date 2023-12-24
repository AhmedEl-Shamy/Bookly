import 'package:flutter/material.dart';

import '../../../../../core/utlis/assets.dart';
import '../../../../../core/utlis/colors.dart';
import '../../../../../core/utlis/size_config.dart';
import '../../../../../core/utlis/text_styles.dart';
import 'best_seller_item_price.dart';

class BestSellerItemBookInfo extends StatelessWidget {
  const BestSellerItemBookInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: SizeConfig.widthBlock * 48,
          child: Text(
            'Harry Potter and the Goblet of Fire',
            style: TextStyles.textStyle18.copyWith(
              fontFamily: AssetsData.gTSectraFineFamily,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        Text(
          'J.K. Rowling',
          style: TextStyles.textStyle14.copyWith(
            color: ThemeColors.secondaryTextColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        const BestSellerItemPrice(),
      ],
    );
  }
}


