import 'package:bookly/core/utlis/app_router.dart';
import 'package:bookly/core/utlis/colors.dart';
import 'package:bookly/core/utlis/services_config.dart';
import 'package:bookly/features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesConfig.init();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(ServicesConfig.homeRepo)..getFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(ServicesConfig.homeRepo)..getNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: ThemeColors.scaffoldBackgroundColor),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
