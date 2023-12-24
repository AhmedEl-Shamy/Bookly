import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.foregroundColor,
    this.borderRadius,
    this.onPressed,
    required this.child,
  });

  final Color backgroundColor;
  final Color foregroundColor;
  final BorderRadius? borderRadius;
  final void Function()? onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: FilledButton(
          onPressed: onPressed?? () {},
          style: FilledButton.styleFrom(
            foregroundColor: foregroundColor,
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(15),
            ),
          ),
          child: child),
    );
  }
}