import 'package:bookly/core/entities/book_entity.dart';
import 'package:flutter/material.dart';

import '../utlis/assets.dart';
import '../utlis/colors.dart';
import '../../config/size_config.dart';
import '../utlis/text_styles.dart';
import 'newest_books_item_price.dart';

class NewestBooksItemBookInfo extends StatelessWidget {
  const NewestBooksItemBookInfo(this.book,{
    super.key,
  });
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: SizeConfig.widthBlock * 48,
          child: Text(
            book.name,
            style: TextStyles.textStyle18.copyWith(
              fontFamily: AssetsData.gTSectraFineFamily,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        Text(
          book.authors?.join(' | ') ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyles.textStyle14.copyWith(
            color: ThemeColors.secondaryTextColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        const NewestBooksItemPrice(),
      ],
    );
  }
}
