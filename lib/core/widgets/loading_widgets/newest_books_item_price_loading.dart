import 'package:flutter/material.dart';

import 'skelton.dart';

class NewestBooksItemPriceLoading extends StatelessWidget {
  const NewestBooksItemPriceLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Skelton(
            width: 40,
            height: 20,
          ),
        ),
        SizedBox(
          width: 50,
        ),
        Expanded(
          flex: 2,
          child: Skelton(
            width: 40,
            height: 20,
          ),
        ),
      ],
    );
  }
}
