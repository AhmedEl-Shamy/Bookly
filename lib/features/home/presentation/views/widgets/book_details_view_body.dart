import 'package:bookly/features/home/presentation/views/widgets/book_details_appbar.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          BookDetailsAppbar(),
        ],
      ),
    );
  }
}


