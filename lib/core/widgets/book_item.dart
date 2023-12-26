import 'package:bookly/core/utlis/app_router.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_item_book_info.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.bookDetails);
      },
      child: const Padding(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: SizedBox(
          height: 125,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BookImage(
                aspectRatio: 70 / 105,
                height: 125,
              ),
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: BestSellerItemBookInfo(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
