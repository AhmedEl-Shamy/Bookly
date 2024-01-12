import 'package:bookly/core/utlis/app_router.dart';
import 'package:bookly/core/utlis/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utlis/colors.dart';

class CustomHomeAppbar extends StatelessWidget {
  const CustomHomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: ThemeColors.scaffoldBackgroundColor,
      titleSpacing: 20,
      pinned: true,
      elevation: 2,
      title: Image.asset(
        AssetsData.logo,
        height: 20,
      ),
      actions: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.searchView);
          },
          icon: Image.asset(
            AssetsData.searchIcon,
            height: 27,
          ),
        ),
        const SizedBox(width: 20,)
      ],
    );
  }
}
