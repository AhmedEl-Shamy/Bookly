import 'package:bookly/core/widgets/loading_widgets/book_image_loading.dart';
import 'package:bookly/core/widgets/loading_widgets/newest_books_item_info.dart';
import 'package:flutter/material.dart';

class BookItemLoading extends StatelessWidget {
  const BookItemLoading(
{
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: const BookImageLoading(
              aspectRatio: 70 / 105,
              height: 125,
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          const Expanded(
            child: NewestBooksItemBookInfoLoading(),
          ),
        ],
      ),
    );
  }
}
