import 'package:bookly/core/utlis/assets.dart';
import 'package:bookly/core/widgets/custom_progress_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookImage extends StatelessWidget {
  final double aspectRatio;
  final double? width, height;
  final Widget? child;
  final String imageUrl;
  const BookImage({
    required this.aspectRatio,
    required this.imageUrl,
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
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Positioned.fill(
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, progress) =>
                    const CustomProgressIndicator(),
              ),
            ),
            if (child != null) child!,
          ],
        ),
      ),
    );
  }

  Container newMethod() {
    return Container(
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
    );
  }
}
