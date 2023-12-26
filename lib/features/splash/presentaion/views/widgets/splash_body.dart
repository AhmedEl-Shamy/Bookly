import 'package:bookly/core/utlis/app_router.dart';
import 'package:bookly/core/utlis/durations.dart';
import 'package:flutter/material.dart';
import 'package:bookly/core/utlis/assets.dart';
import 'package:go_router/go_router.dart';
import 'scaled_text.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  late AnimationController textAnimationController;
  late Animation<double> textAnimation;

  @override
  void initState() {
    super.initState();
    initTextAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    textAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(height: 5),
        ScaledText(textAnimation: textAnimation),
      ],
    );
  }

  void initTextAnimation() {
    textAnimationController = AnimationController(
      vsync: this,
      duration: DurationsData.primaryAnimationDuration,
    );
    textAnimation = CurvedAnimation(
      parent: textAnimationController,
      curve: Curves.easeInOut,
    );
    Future.delayed(const Duration(seconds: 1), () {
      textAnimationController.forward();
    });
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        GoRouter.of(context).pushReplacement(AppRouter.homeViewRoute);
      },
    );
  }
}
