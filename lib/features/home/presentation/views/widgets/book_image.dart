import 'package:bookly/core/utlis/assets.dart';
import 'package:flutter/material.dart';

class BookImage extends StatelessWidget {
  final double aspectRatio;
  final double? width, height;
  final Widget? child;
  const BookImage({
    required this.aspectRatio,
    this.width,
    this.height,
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: AspectRatio(
        aspectRatio: aspectRatio,
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
          child: child,
        ),
      ),
    );
  }
}