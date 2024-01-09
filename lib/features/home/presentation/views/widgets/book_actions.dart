import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/models/book_model/book_model.dart';
import '../../../../../core/utlis/colors.dart';
import '../../../../../core/utlis/text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';

class BookActions extends StatelessWidget {
  const BookActions(
    this.book, {
    super.key,
  });
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          if (book.saleInfo!.saleability == 'FOR_SALE')
            Expanded(
              child: CustomButton(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                borderRadius: BorderRadius.horizontal(
                    left: const Radius.circular(15),
                    right: (book.volumeInfo!.previewLink == null)
                        ? const Radius.circular(15)
                        :  Radius.zero),
                onPressed: () async {
                  Uri uri = Uri.parse(book.volumeInfo!.canonicalVolumeLink!);
                  if (await canLaunchUrl(uri)) {
                    launchUrl(uri);
                  }
                },
                child: Text(
                  'Buy',
                  style: TextStyles.textStyle18.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          if (book.volumeInfo!.previewLink != null)
            Expanded(
              child: CustomButton(
                backgroundColor: ThemeColors.previewButtonColor,
                foregroundColor: Colors.white,
                borderRadius: BorderRadius.horizontal(
                  right: const Radius.circular(15),
                  left: (book.saleInfo!.saleability != 'FOR_SALE')
                      ? const Radius.circular(15)
                      : Radius.zero,
                ),
                onPressed: () async {
                  Uri uri = Uri.parse(book.volumeInfo!.previewLink!);
                  if (await canLaunchUrl(uri)) {
                    launchUrl(uri);
                  }
                },
                child: Text(
                  'Free Preview',
                  style: TextStyles.textStyle18.copyWith(
                    fontFamily:
                        Theme.of(context).textTheme.bodyLarge!.fontFamily,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          if (book.volumeInfo!.previewLink == null &&
              book.saleInfo!.saleability != 'FOR_SALE')
            Text(
              'This book is not Available!',
              style: TextStyles.textStyle16.copyWith(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            )
        ],
      ),
    );
  }
}
