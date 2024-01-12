import 'package:bookly/core/widgets/custom_image_error.dart';
import 'package:bookly/core/widgets/loading_widgets/book_image_loading.dart';
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
              child: (imageUrl != '')
                  ? CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.fill,
                      // progressIndicatorBuilder: (context, url, progress) =>
                      //     const CustomProgressIndicator(),
                      progressIndicatorBuilder: (context, url, progress) => BookImageLoading(aspectRatio: aspectRatio),
                      errorWidget: (context, url, error) =>
                          const CustomImageError(),
                    )
                  : const CustomImageError(),
            ),
            if (child != null) child!,
          ],
        ),
      ),
    );
  }
}
