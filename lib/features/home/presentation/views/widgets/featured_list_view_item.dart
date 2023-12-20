import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../../core/utlis/assets.dart';
import '../../../../../core/utlis/size_config.dart';

class FeaturedListViewItem extends StatelessWidget {
  const FeaturedListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:15),
      child: SizedBox(
        height: SizeConfig.heightBlock * 25,
        child: AspectRatio(
          aspectRatio: 150 / 224,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AssetsData.book),
              ),
            ),
            alignment: AlignmentDirectional.bottomEnd,
            child: SizedBox(
              width: 45,
              height: 45,
              child: ClipOval(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 7.5, sigmaY: 7.5),
                  child: const Icon(Icons.play_arrow),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}