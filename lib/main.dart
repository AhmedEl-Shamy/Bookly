import 'package:bookly/core/utlis/colors.dart';
import 'package:bookly/features/splash/presentaion/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: ThemeColors.scaffoldBackgroundColor),
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
