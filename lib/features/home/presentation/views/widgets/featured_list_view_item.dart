import 'dart:ui';

import 'package:bookly/features/home/presentation/views/widgets/book_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utlis/size_config.dart';

class FeaturedListViewItem extends StatelessWidget {
  const FeaturedListViewItem(this.imageUrl,{super.key});
  final String imageUrl;
  @override 
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BookImage(
          imageUrl: imageUrl,
          aspectRatio: 150 / 224,
          height: SizeConfig.heightBlock * 25,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: 45,
              height: 45,
              child: ClipOval(
                child: Container(
                  color: Colors.black.withOpacity(0.25),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 7.5, sigmaY: 7.5),
                    child: const Icon(Icons.play_arrow),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
