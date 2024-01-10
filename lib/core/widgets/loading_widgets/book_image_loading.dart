import 'package:bookly/core/widgets/loading_widgets/skelton.dart';
import 'package:flutter/material.dart';

class BookImageLoading extends StatelessWidget {
  final double aspectRatio;
  final double? width, height;
  final Widget? child;
  const BookImageLoading({
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
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            const Positioned.fill(
              child: Skelton(),
            ),
            if (child != null) child!,
          ],
        ),
      ),
    );
  }
}