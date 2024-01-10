import 'package:bookly/core/widgets/loading_widgets/book_item_loading.dart';
import 'package:flutter/material.dart';

class BookItemListLoading extends StatelessWidget {
  const BookItemListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: BookItemLoading(),
      ),
      itemCount: 15,
    );
  }
}
