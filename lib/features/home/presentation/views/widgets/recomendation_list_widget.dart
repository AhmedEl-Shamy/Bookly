import 'package:flutter/material.dart';

import '../../../../../core/utlis/text_styles.dart';
import 'recomendation_books_list.dart';

class RecomendationListWidget extends StatelessWidget {
  const RecomendationListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            'You can see also',
            style: TextStyles.textStyle14.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const RecomendationList(),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
