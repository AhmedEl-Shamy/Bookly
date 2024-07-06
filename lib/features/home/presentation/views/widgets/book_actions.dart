import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utlis/colors.dart';
import '../../../../../core/utlis/text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';

class BookActions extends StatelessWidget {
  const BookActions(
    this.book, {
    super.key,
  });
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          if (book.saleability == 'FOR_SALE')
            Expanded(
              child: CustomButton(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                borderRadius: BorderRadius.horizontal(
                    left: const Radius.circular(15),
                    right: (book.previewLink == null)
                        ? const Radius.circular(15)
                        :  Radius.zero),
                onPressed: () async {
                  Uri uri = Uri.parse(book.canonicalVolumeLink!);
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
          if (book.previewLink != null && book.previewLink!.isNotEmpty)
            Expanded(
              child: CustomButton(
                backgroundColor: ThemeColors.previewButtonColor,
                foregroundColor: Colors.white,
                borderRadius: BorderRadius.horizontal(
                  right: const Radius.circular(15),
                  left: (book.saleability != 'FOR_SALE')
                      ? const Radius.circular(15)
                      : Radius.zero,
                ),
                onPressed: () async {
                  Uri uri = Uri.parse(book.previewLink!);
                  if (await canLaunchUrl(uri)) {
                    launchUrl(uri);
                  }
                },
                child: Text(
                  'Preview',
                  style: TextStyles.textStyle18.copyWith(
                    fontFamily:
                        Theme.of(context).textTheme.bodyLarge!.fontFamily,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          if ((book.previewLink == null || book.previewLink!.isEmpty) &&
              book.saleability != 'FOR_SALE')
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
