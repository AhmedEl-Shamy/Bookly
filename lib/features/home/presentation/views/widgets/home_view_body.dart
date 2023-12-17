import 'package:bookly/core/utlis/size_config.dart';
import 'package:bookly/core/utlis/text_styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_view_appbar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomeAppBar(),
        SizedBox(
          height: SizeConfig.heightBlock * 25,
          child: const FeaturedListView(),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, top: SizeConfig.heightBlock * 6),
          child: const Text(
            'Best Seller',
            style: TextStyles.titleMedium,
          ),
        ),
        // const BestSellerItem(),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => const BestSellerItem(),
            ),
          ),
        ),
      ],
    );
  }
}


