import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/app_router.dart';
import '../../../../../core/widgets/book_image.dart';

class RecomendationListItem extends StatelessWidget {
  const RecomendationListItem(
    this.book, {
    super.key,
  });
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: GestureDetector(
        onTap: (){
          GoRouter.of(context).pushReplacement(AppRouter.bookDetails, extra: book);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: BookImage(
            imageUrl: book.image,
            aspectRatio: 70 / 112,
            height: 112,
          ),
        ),
      ),
    );
  }
}