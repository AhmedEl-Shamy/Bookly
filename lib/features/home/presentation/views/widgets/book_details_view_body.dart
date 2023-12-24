import 'package:bookly/core/utlis/size_config.dart';
import 'package:bookly/core/utlis/text_styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_appbar.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_info.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_image.dart';
import 'package:flutter/material.dart';

import 'book_actions.dart';
import 'recomendation_list.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const BookDetailsAppbar(),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.widthBlock * 20),
            child: const BookImage(aspectRatio: 162 / 243),
          ),
          const BookDetailsInfo(),
          const BookActions(),
          const RecomendationList(),
        ],
      ),
    );
  }
}