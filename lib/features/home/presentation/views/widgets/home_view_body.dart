import 'package:bookly/config/size_config.dart';
import 'package:bookly/core/utlis/text_styles.dart';
import 'package:bookly/features/home/presentation/controllers/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/controllers/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_view_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'newest_books_list_sliver.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () => _refresh(context),
        child: CustomScrollView(
          slivers: [
            const CustomHomeAppbar(),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: SizeConfig.heightBlock * 25,
                    child: const FeaturedListView(),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      top: 30,
                      bottom: 20,
                    ),
                    child: Text(
                      'Newest Books',
                      style: TextStyles.titleMedium,
                    ),
                  ),
                ],
              ),
            ),
            const BestSellerListSliver()
          ],
        ),
      ),
    );
  }

  Future<void> _refresh(BuildContext context) async {
    BlocProvider.of<FeaturedBooksCubit>(context).getFeaturedBooks();
    BlocProvider.of<NewestBooksCubit>(context).getNewestBooks();
  }
}

