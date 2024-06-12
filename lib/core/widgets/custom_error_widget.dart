import 'package:bookly/core/utlis/text_styles.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget(this.errorMsg, {super.key});
  final String errorMsg;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          errorMsg,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomButton(
          backgroundColor: Colors.white,
          foregroundColor: Theme.of(context).colorScheme.surface,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Refresh',
                style: TextStyles.textStyle16.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10,),
              const Icon(Icons.refresh)
            ],
          ),
          onPressed: (){
            BlocProvider.of<FeaturedBooksCubit>(context).getFeaturedBooks();
            BlocProvider.of<NewestBooksCubit>(context).getNewestBooks();
          },
        )
      ],
    );
  }
}
