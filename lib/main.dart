import 'package:bookly/core/utlis/app_router.dart';
import 'package:bookly/core/utlis/colors.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: ThemeColors.scaffoldBackgroundColor),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
