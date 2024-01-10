import 'package:flutter/material.dart';

class Skelton extends StatefulWidget {
  const Skelton({
    this.width,
    this.height,
    super.key,
  });
  final double? width;
  final double? height;
  @override
  State<Skelton> createState() => _SkeltonState();
}

class _SkeltonState extends State<Skelton> with SingleTickerProviderStateMixin {
  late AnimationController _animation;
  late double gradientStop = 0.1;
  @override
  void initState() {
    _animation = AnimationController(
      vsync: this,
      lowerBound: 0.25,
      upperBound: 1,
      duration: const Duration(seconds: 1),
    );
    _animation.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => Container(
        width: widget.width,
        height: widget.height,
        color: Colors.grey.withOpacity(_animation.value),
        child: child,
      ),
    );
  }
}
