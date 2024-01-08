import 'package:bookly/core/utlis/services_config.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/view_models/cubit/recomendation_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/search/presentation/views/search_view.dart';
import 'package:bookly/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/views/book_details_view.dart';

class AppRouter {
  static const String homeViewRoute = '/homeView';
  static const String bookDetails = '/bookDetails';
  static const String searchView = '/searchView';
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: homeViewRoute,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: bookDetails,
        builder: (context, state) => BlocProvider(
          create: (context) => RecomendationBooksCubit(ServicesConfig.homeRepo)
            ..getRecomendationBooks(
              (state.extra as BookModel).volumeInfo!.categories?[0] ?? 'programming',
            ),
          child: BookDetailsView(state.extra as BookModel),
        ),
      ),
      GoRoute(
        path: searchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
