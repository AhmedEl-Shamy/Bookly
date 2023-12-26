import 'package:flutter/material.dart';

class ScaledText extends StatelessWidget {
  const ScaledText({
    super.key,
    required this.textAnimation,
  });

  final Animation<double> textAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: textAnimation,
      builder: (context, _) => ScaleTransition(
        scale: textAnimation,
        child: const Text(
          'Read free books',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
