import 'package:bookly/config/app_router.dart';
import 'package:bookly/core/services/db_service.dart';
import 'package:bookly/core/utlis/colors.dart';
import 'package:bookly/core/utlis/dependency_injection.dart';
import 'package:bookly/features/home/presentation/controllers/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/controllers/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  DBServiceImpl.initHive();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl.get<FeaturedBooksCubit>()..getFeaturedBooks()
        ),
        BlocProvider(
          create: (context) => sl.get<NewestBooksCubit>()..getNewestBooks(),
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
