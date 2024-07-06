
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utlis/colors.dart';


class BookDetailsAppbar extends StatelessWidget {
  const BookDetailsAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: ThemeColors.scaffoldBackgroundColor,
      titleSpacing: 20,
      pinned: true,
      elevation: 2,
      leading: IconButton(
        onPressed: () {
          GoRouter.of(context).pop();
        },
        icon: const Icon(Icons.close),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart_outlined),
        ),
        const SizedBox(
          width: 20,
        )
      ],
    );
  }
}
