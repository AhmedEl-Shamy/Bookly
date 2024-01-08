import 'package:flutter/material.dart';

import 'custom_search_text_field.dart';
import 'search_results.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            CustomSearchTextField(),
            SizedBox(
              height: 20,
            ),
            Expanded(child: SearchResults()),
          ],
        ),
      ),
    );
  }
}

