import 'package:flutter/material.dart';

import '../../../../../core/utlis/text_styles.dart';
import 'search_results_list.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Search Results',
          style: TextStyles.titleMedium,
        ),
        SizedBox(
          height: 20,
        ),
        SearchResultsList(),
      ],
    );
  }
}
