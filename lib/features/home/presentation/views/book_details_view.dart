import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

import 'widgets/book_details_view_body.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView(this.book, {super.key});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailsViewBody(book),
    );
  }
}
