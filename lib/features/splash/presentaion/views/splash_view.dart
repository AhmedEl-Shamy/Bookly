import 'package:flutter/material.dart';
import 'package:bookly/features/splash/presentaion/views/widgets/splash_body.dart';

import '../../../../core/utlis/size_config.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.initSizeConfig(context);
    return const Scaffold(
      body: SplashBody(),
    );
  }
}
