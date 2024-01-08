import 'package:bookly/core/utlis/size_config.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_appbar.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_info.dart';
import 'package:bookly/core/widgets/book_image.dart';
import 'package:flutter/material.dart';

import 'book_actions.dart';
import 'recomendation_list_widget.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody(this.book, {super.key});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BookDetailsAppbar(),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthBlock * 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: BookImage(
                      aspectRatio: 162 / 243,
                      imageUrl: book.volumeInfo!.imageLinks?.thumbnail! ?? '',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                BookDetailsInfo(book),
                const SizedBox(
                  height: 30,
                ),
                const BookActions(),
                const SizedBox(
                  height: 30,
                ),
                const RecomendationListWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
