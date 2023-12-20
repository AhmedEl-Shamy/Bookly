import 'package:bookly/features/home/presentation/views/widgets/best_seller_item_book_info.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utlis/assets.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        height: 125,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 125,
              child: AspectRatio(
                aspectRatio: 70 / 105,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(AssetsData.book),
                    ),
                  ),
                  alignment: AlignmentDirectional.bottomEnd,
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            const Expanded(
              child: BestSellerItemBookInfo(),
            ),
          ],
        ),
      ),
    );
  }
}

