import 'package:flutter/material.dart';

import '../../../../../core/utlis/text_styles.dart';
import 'book_image.dart';

class RecomendationList extends StatelessWidget {
  const RecomendationList({
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
        SizedBox(
          height: 112,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => const Padding(
              padding: EdgeInsets.only(left: 10),
              child: BookImage(
                imageUrl: 'https://www.designforwriters.com/wp-content/uploads/2017/10/design-for-writers-book-cover-tf-2-a-million-to-one.jpg',
                aspectRatio: 70 / 112,
                height: 112,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
