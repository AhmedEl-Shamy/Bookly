import 'package:bookly/core/widgets/loading_widgets/newest_books_item_price_loading.dart';
import 'package:bookly/core/widgets/loading_widgets/skelton.dart';
import 'package:flutter/material.dart';

import '../../utlis/size_config.dart';

class NewestBooksItemBookInfoLoading extends StatelessWidget {
  const NewestBooksItemBookInfoLoading(
{
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Skelton(
          width: SizeConfig.widthBlock *50,
          height: 20,
        ),
        Skelton(
          width: SizeConfig.widthBlock * 25,
          height: 20,
        ),
        const NewestBooksItemPriceLoading(),
      ],
    );
  }
}
