import 'package:bookly/core/utlis/size_config.dart';
import 'package:bookly/core/utlis/text_styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_view_appbar.dart';
import 'package:flutter/material.dart';

import 'best_seller_list_sliver.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeAppbar(),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: SizeConfig.heightBlock * 25,
                  child: const FeaturedListView(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 20, top: SizeConfig.heightBlock * 6),
                  child: const Text(
                    'Best Seller',
                    style: TextStyles.titleMedium,
                  ),
                ),
              ],
            ),
          ),
          const BestSellerListSliver()
        ],
      ),
    );
  }
}


