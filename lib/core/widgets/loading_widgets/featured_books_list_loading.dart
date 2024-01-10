import 'package:flutter/material.dart';

import 'featured_books_loading_item.dart';

class FeaturedBooksListLoading extends StatelessWidget {
  const FeaturedBooksListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => const FeaturedBooksLoadingItem(),
      itemCount: 5,
    );
  }
}
