import 'package:bookly/core/utlis/assets.dart';
import 'package:bookly/core/utlis/size_config.dart';
import 'package:bookly/core/utlis/text_styles.dart';
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
        Row(
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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: SizeConfig.widthBlock * 48,
                  child: const Text(
                    'Harry Potter and the Goblet of Fire',
                    style: TextStyles.bookTitleStyle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'J.K. Rowling',
                  style: TextStyles.authonStyle,
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
