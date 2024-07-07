import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/entities/book_entity.dart';
import 'featured_list_view_item.dart';

class FeaturedCarouselSlider extends StatelessWidget {
  const FeaturedCarouselSlider({
    super.key, required this.books,
  });
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: books.length,
      itemBuilder: (context, index, realIndex) => FeaturedListViewItem(
        books[index],
      ),
      options: CarouselOptions(
        autoPlay: true,
        reverse: true,
        enlargeCenterPage: true,
        padEnds: true,
        disableCenter: true,
        aspectRatio: 70 / 105,
        height: 125,
        viewportFraction: 0.38,
        enlargeFactor: 0.4,
      ),
    );
  }
}