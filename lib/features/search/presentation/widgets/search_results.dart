import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/utlis/text_styles.dart';
import 'search_results_list_view_bloc_consumer.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Search Results',
          style: TextStyles.titleMedium,
        ),
        const SizedBox(
          height: 20,
        ),
        SearchResultsListViewBlocConsumer(),
      ],
    );
  }
}
