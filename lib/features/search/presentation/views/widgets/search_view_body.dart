import 'package:flutter/material.dart';

import '../../../../../core/utlis/text_styles.dart';
import 'custom_search_text_field.dart';
import 'search_results_list.dart';

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
            Text(
              'Search Results',
              style: TextStyles.titleMedium,
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SearchResultsList(),
            ),
          ],
        ),
      ),
    );
  }
}
