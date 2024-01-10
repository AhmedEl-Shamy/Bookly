import 'package:flutter/material.dart';

import 'book_image_loading.dart';

class RecomendationListItemLoading extends StatelessWidget {
  const RecomendationListItemLoading({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: const BookImageLoading(
          aspectRatio: 70 / 112,
          height: 112,
        ),
      ),
    );
  }
}
