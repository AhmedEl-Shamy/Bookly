import 'package:bookly/core/utlis/dependency_injection.dart';
import 'package:bookly/core/utlis/durations.dart';
import 'package:bookly/core/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/controllers/recommendation_books_cubit/recommendation_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/search/presentation/views/search_view.dart';
import 'package:bookly/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../features/home/presentation/views/book_details_view.dart';

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
        pageBuilder: (context, state) => createTransitionPage(
          state: state,
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path: bookDetails,
        pageBuilder: (context, state) => createTransitionPage(
          state: state,
          child: BlocProvider(
            create: (context) =>
                sl.get<RecommendationBooksCubit>()..getRecommendationBooks(
                    (state.extra as BookEntity).category,
                  ),
            child: BookDetailsView(state.extra as BookEntity),
          ),
        ),
      ),
      GoRoute(
        path: searchView,
        pageBuilder: (context, state) => createTransitionPage(
          state: state,
          child: const SearchView(),
        ),
      ),
    ],
  );

  static CustomTransitionPage<dynamic> createTransitionPage({
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: DurationsData.primaryAnimationDuration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeIn,
          ),
          child: child,
        );
      },
    );
  }
}
