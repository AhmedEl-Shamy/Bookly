import 'package:bookly/core/utlis/app_router.dart';
import 'package:bookly/core/utlis/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: ThemeColors.scaffoldBackgroundColor),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      // home: const SplashView(),
    );
  }
}
