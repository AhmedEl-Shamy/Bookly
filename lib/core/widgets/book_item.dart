import 'package:bookly/config/app_router.dart';
import 'package:bookly/core/widgets/newest_books_item_book_info.dart';
import 'package:bookly/core/widgets/book_image.dart';
import 'package:bookly/core/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookItem extends StatelessWidget {
  const BookItem(
    this.book, {
    super.key,
  });
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.bookDetails, extra: book);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: BookImage(
                imageUrl: book.image,
                aspectRatio: 70 / 105,
                height: 125,
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: NewestBooksItemBookInfo(book),
            ),
          ],
        ),
      ),
    );
  }
}
