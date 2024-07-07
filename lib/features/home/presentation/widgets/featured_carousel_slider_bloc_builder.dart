import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/loading_widgets/featured_books_list_loading.dart';
import 'package:bookly/features/home/presentation/controllers/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'featured_carousel_slider.dart';

class FeaturedCarouselSliderBlocBuilder extends StatelessWidget {
  const FeaturedCarouselSliderBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
          if (state is FeaturedBooksSuccess) {
            return FeaturedCarouselSlider(
              books: state.books,
            );
          } else if (state is FeaturedBooksFailed) {
            return CustomErrorWidget(state.failure.errorMsg);
          } else {
            return const FeaturedBooksListLoading();
          }
        },
      ),
    );
  }
}


