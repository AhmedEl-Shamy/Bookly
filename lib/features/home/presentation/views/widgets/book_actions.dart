import 'package:flutter/material.dart';

import '../../../../../core/utlis/colors.dart';
import '../../../../../core/utlis/text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';

class BookActions extends StatelessWidget {
  const BookActions({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(15),
                ),
                child: Text(
                  'Free',
                  style: TextStyles.textStyle18.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
          Expanded(
            child: CustomButton(
              backgroundColor: ThemeColors.previewButtonColor,
              foregroundColor: Colors.white,
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(15),
              ),
              child: Text(
                'Free Preview',
                style: TextStyles.textStyle18.copyWith(
                  fontFamily: Theme.of(context).textTheme.bodyLarge!.fontFamily,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
