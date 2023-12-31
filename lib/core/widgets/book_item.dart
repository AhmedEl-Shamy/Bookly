import 'package:bookly/core/utlis/app_router.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_item_book_info.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookItem extends StatelessWidget {
  const BookItem(
    this.book, {
    super.key,
  });
  final BookModel book;
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
                imageUrl: book.volumeInfo!.imageLinks?.thumbnail! ?? '',
                aspectRatio: 70 / 105,
                height: 125,
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: BestSellerItemBookInfo(book),
            ),
          ],
        ),
      ),
    );
  }
}
