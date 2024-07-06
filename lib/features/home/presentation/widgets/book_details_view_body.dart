import 'package:bookly/config/size_config.dart';
import 'package:bookly/core/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/widgets/book_details_appbar.dart';
import 'package:bookly/features/home/presentation/widgets/book_details_info.dart';
import 'package:bookly/core/widgets/book_image.dart';
import 'package:flutter/material.dart';

import 'book_actions.dart';
import 'recomendation_list_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody(this.book, {super.key});

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const BookDetailsAppbar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                        imageUrl: book.image,
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
                  BookActions(book),
                  const SizedBox(
                    height: 30,
                  ),
                  RecomendationListSection(book: book,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
