import 'package:bookly/core/widgets/loading_widgets/recommendation_list_item_loading.dart';
import 'package:flutter/material.dart';

class RecommendationListLoading extends StatelessWidget {
  const RecommendationListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => const RecomendationListItemLoading(),
      itemCount: 4,
    );
  }
}
