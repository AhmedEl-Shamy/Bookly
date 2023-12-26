import 'package:bookly/core/widgets/book_item.dart';
import 'package:flutter/material.dart';

class BestSellerListSliver extends StatelessWidget {
  const BestSellerListSliver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => const Padding(
          padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
          child: BookItem(),
        ),
        childCount: 20,
      ),
    );
  }
}
