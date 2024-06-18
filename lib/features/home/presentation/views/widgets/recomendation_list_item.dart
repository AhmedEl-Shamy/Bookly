import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/app_router.dart';
import '../../../data/models/book_model/book_model.dart';
import '../../../../../core/widgets/book_image.dart';

class RecomendationListItem extends StatelessWidget {
  const RecomendationListItem(
    this.book, {
    super.key,
  });
  final BookModel book;
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
            imageUrl: book.volumeInfo?.imageLinks?.thumbnail ?? '',
            aspectRatio: 70 / 112,
            height: 112,
          ),
        ),
      ),
    );
  }
}