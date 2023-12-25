import 'package:bookly/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';

class BestSellerListSliver extends StatelessWidget {
  const BestSellerListSliver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => const BestSellerItem(),
        childCount: 20,
      ),
    );
  }
}
