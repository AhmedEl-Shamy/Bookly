import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import 'widgets/book_details_view_body.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView(this.book, {super.key});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailsViewBody(book),
    );
  }
}
