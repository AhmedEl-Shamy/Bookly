import 'package:bookly/core/utlis/size_config.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_appbar.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_info.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        const BookDetailsAppbar(),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthBlock * 20),
          child: const BookImage(aspectRatio: 162 / 243),
        ),
        const SizedBox(
          height: 40,
        ),
        const BookDetailsInfo(),
      ]),
    );
  }
}


